<!-- # YouTube video downloader # -->

<p align="center">
  <h1 align="center">YouTube Video Downloader</h1>
</p>

<p align="center">
  <a href="https://www.youtube.com">
    <img max-width="640px" max-height="360px" src="assets/img/youtube-logo.png" alt="YouTube" />
  </a>
</p>

<!-- ![YouTube Logo Image](assets/img/youtube-logo.png) -->

`youtube` `video` `downloader` `youtube-dl` `mpeg` `mp4` `mkv`

---

<details>
  <summary>Credit: <strong>youtube-dl</strong></summary>
  <pre><p> - Downloader of videos</p></pre>
  <p>
**youtube-dl** is a small command-line program to download videos from
YouTube.com and other sites that don't provide direct links to the
videos served
  </p>
  <p>
It allows the user, among other things, to choose a specific video
quality to download (if available) or let the program automatically
determine the best (or worst) quality video to grab. It supports
downloading entire playlists and all videos from a given user.
  </p>
  <div>
    <a href="https://rg3.github.com/youtube-dl/"><small>Homepage</small></a>
  </div>
</details>

## Setup ##

```shell
$ sudo apt install youtube-dl/xenial
```

## Usage ##

```shell
# Default format

$ youtube-dl "https://www.youtube.com/watch?v=8QSl_t65wnw"
Volcano Eruption Power Comparison-8QSl_t65wnw.webm
```

```shell
# MPEG-4

$ youtube-dl --get-filename -f mp4 "https://www.youtube.com/watch?v=8QSl_t65wnw"
Volcano Eruption Power Comparison-8QSl_t65wnw.mp4
```

### Examples ###

```shell
# Regular download in MP4 format
$ youtube-dl -f mp4 "https://www.youtube.com/watch?v=8QSl_t65wnw"
[youtube] 8QSl_t65wnw: Downloading webpage
[youtube] 8QSl_t65wnw: Downloading video info webpage
[youtube] 8QSl_t65wnw: Extracting video information
[download] Destination: Volcano Eruption Power Comparison-8QSl_t65wnw.mp4
[download] 100% of 17.47MiB in 01:09
```

```shell
# BATCH of videos from file (one url per line)
$ youtube-dl --batch-file download-list.txt
```

#### File name templates ####

> The -o option allows users to indicate a template for the output file names.

```shell
# youtube id
$ youtube-dl -f mp4 \
             -o '/tmp/%(title)s_%(id)s.%(ext)s' \
             "https://www.youtube.com/watch?v=8QSl_t65wnw"
[download] Resuming download at byte 1108268
[download] Destination: /tmp/Volcano Eruption Power Comparison_8QSl_t65wnw.mp4
```

```shell
# duration
$ youtube-dl -f mp4 \
             -o '/tmp/%(title)s_[%(duration)0ds]_[%(id)s].%(ext)s' \
             "https://www.youtube.com/watch?v=8QSl_t65wnw"
[download] Destination: /tmp/Volcano Eruption Power Comparison_[318s]_[8QSl_t65wnw].mp4
```

```shell
# resolution
$ youtube-dl -f mp4 \
             -o '/tmp/%(title)s_[%(duration)0ds]_[%(id)s]-%(resolution)s.%(ext)s' \
             "https://www.youtube.com/watch?v=8QSl_t65wnw"
[download] Destination: /data/downloads/youtube/Volcano Eruption Power Comparison_[318s]_[8QSl_t65wnw]-1280x650.mp4
```

## Default configuration settings ##

You can configure youtube-dl by placing any supported command line option to a configuration file.

On **Linux** and **OS X**,
- the system wide configuration file is located at: `/etc/youtube-dl.conf`
- the user wide configuration file at: `~/.config/youtube-dl/config`.

On **Windows**, the user wide configuration file locations are:
- `%APPDATA%\youtube-dl\config.txt`
or
- `C:\Users\<user name>\youtube-dl.conf`

Note that by default configuration file may not exist so you may need to create it yourself.
```shell
$ touch /etc/youtube-dl.conf
```

### Most useful options explained ###

```shell
# Lines starting with # are comments

# download in MPEG-4 video format
--format mp4

# Force resume of partially downloaded files
--continue

# Write video description to a .description file
--write-description

# Number of seconds to sleep before each download
--sleep-interval 10

# Maximum download rate in bytes per second
--limit-rate 100K

# Do not copy the mtime
--no-mtime

# Save all videos in directory
-o '/data/downloads/youtube/%(title)s_[%(duration)0ds]_[%(id)s]-%(resolution)s.%(ext)s'

```

### Download video and extract audio in MP3 format ###

```shell
SRC="http://www.youtube.com/watch?v=alehFQfI1o0" \
&& youtube-dl -x \
  --audio-format mp3 \
  --audio-quality 320K \
  --prefer-avconv \
  -k \
  ${SRC} ;
```

---

:scorpius:
