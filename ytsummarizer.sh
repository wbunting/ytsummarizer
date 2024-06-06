#!/bin/bash

# ENVIRONMENT VARIABLES {{{
: "${YTSUMMARIZER_CONFIG_DIR:=${XDG_CONFIG_HOME:-$HOME/.config}/ytsummarizer}"
#}}}

API_KEY_FILE="$YTSUMMARIZER_CONFIG_DIR/api_key"

if [ ! -f "$API_KEY_FILE" ]; then
  echo "API key file not found. Please add your API key to $API_KEY_FILE"
  exit 1
fi

API_KEY=$(cat "$API_KEY_FILE")

if [ -z "$1" ]; then
  echo "Usage: $0 <video_url>"
  exit 1
fi

show_spinner() {
  local pid=$1
  local message=$2
  local delay=0.1
  local spinstr='|/-\'
  tput civis
  printf "%s " "$message"
  while kill -0 "$pid" 2>/dev/null; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  echo ""
  tput cnorm
}

video_url="$1"
video_id=$(echo "$video_url" | sed -n 's/.*v=\([^&]*\).*/\1/p')

yt_dlp_output() {
  yt-dlp --write-auto-sub --sub-lang en -q --skip-download -o "${video_id}.%(ext)s" "$video_url" 2>&1
}

yt_dlp_output &
pid=$!
show_spinner $pid "Fetching subtitles"
wait $pid

subtitle_file="${video_id}.en.vtt"
output_file="compressed_${subtitle_file}"

awk '
BEGIN {
  prev_line = ""
}
{
  gsub(/<[^>]*>|[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{3} --> [0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{3}.*|WEBVTT|Kind:.*|Language:.*|align:.*|position:.*|line:.*|size:.*/, "")

  gsub(/^[ \t]+|[ \t]+$/, "")

  if (length($0) > 0 && $0 != prev_line) {
    print $0
    prev_line = $0
  }
}
' "$subtitle_file" > "$output_file"

rm "$subtitle_file"

awk -v id="$video_id" 'NR%1000==1{x=id "_chunk"++i".txt"}{print > x}' "$output_file"
rm "$output_file"

echo "Subtitles downloaded and cleaned"
echo

for chunk in "${video_id}"_chunk*.txt; do
  chunk_text=$(cat "$chunk")
  json_payload=$(jq -n --arg text "$chunk_text" \
    '{"model": "gpt-4", "messages": [{"role": "user", "content": ("Please summarize the following subtitles: \n\n" + $text)}], "max_tokens": 150}')
  (
    echo "$json_payload" | curl -s -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $API_KEY" -d @- https://api.openai.com/v1/chat/completions | jq -r '.choices[0].message.content'
  ) &
  pid=$!

  show_spinner $pid "Summarizing with AI"
  summary=$(wait $pid)

  echo -e "\n$summary"
done

for chunk in "${video_id}"_chunk*.txt; do
  if [ -f "$chunk" ]; then
    rm "$chunk"
  fi
done

