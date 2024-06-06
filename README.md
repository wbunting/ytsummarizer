
---

<p align="center">
    <a> <img src=.assets/logo.png></a>
    <br />
    <br />
	<a href="https://github.com/wbunting/ytsummarizer/stargazers"><img src="https://img.shields.io/github/stars/wbunting/ytsummarizer?color=orange&logo=github&style=flat-square"></a>
    <a href="https://github.com/wbunting/ytsummarizer"><img src="https://img.shields.io/github/license/wbunting/ytsummarize"></a>
	<a href="https://github.com/wbunting/ytsummarizer/commits/master"><img src="https://img.shields.io/github/commit-activity/m/wbunting/ytsummarizer?color=green&style=flat-square"></a>
    <br />
    <br />
    <i>`ytsummarizer` is a Bash script that leverages AI to generate concise summaries of YouTube videos using their subtitles. This tool helps you quickly understand the content of videos without having to watch them in their entirety.</i>
	<hr>
</p>

<h1 align="center">
   Here's a demo
</h1>
<p align="center">
<img src=.assets/demo.gif width="100%">
</p>

---

## Features

- **AI-Powered Summarization**: Uses OpenAI GPT models to summarize video content.
- **Subtitle Extraction**: Automatically extracts subtitles from YouTube videos.
- **Simple to Use**: Just provide the YouTube video link, and the script handles the rest.
- **Open Source**: Fully open source and free to use (except for the OpenAI credits)


## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)
- [Examples](#examples)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [License](#license)

## Getting Started

### Prerequisites

Ensure you have the following installed:

- Bash
- `yt-dlp` (for downloading subtitles)
- `jq` (for handling JSON)
- `curl` (for API requests)

### Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/wbunting/ytsummarize.git
    cd ytsummarize
    ```

2. Make the script executable:

    ```sh
    chmod +x ytsummarize.sh
    ```

### Configuration

To use the OpenAI API, you need to set up your API key:

1. Create a configuration directory:

    ```sh
    mkdir -p ~/.config/ytsummarize
    ```

2. Save your OpenAI API key in a file:

    ```sh
    echo "YOUR_OPENAI_API_KEY" > ~/.config/ytsummarize/api_key
    ```

## Usage

To summarize a YouTube video, run the script with the video URL as an argument:

```sh
./ytsummarize.sh <video_url>
Example:

./ytsummarize.sh https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

## Requirements
 - Bash
 - yt-dlp
 - jq
 - curl


## License
This project is licensed under the MIT License. See the LICENSE file for details.

