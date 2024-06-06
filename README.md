# ytsummarizer 

![License](https://img.shields.io/github/license/your-username/ytsummarize)
![Issues](https://img.shields.io/github/issues/your-username/ytsummarize)
![Stars](https://img.shields.io/github/stars/your-username/ytsummarize)
![Forks](https://img.shields.io/github/forks/your-username/ytsummarize)

## Overview

`ytsummarizer` is a Bash script that leverages AI to generate concise summaries of YouTube videos using their subtitles. This tool helps you quickly understand the content of videos without having to watch them in their entirety.

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

