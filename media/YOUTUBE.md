# Download video from YouTube #

![YouTube Logo Image](assets/img/youtube-logo.png)

`youtube` `video` `downloader` `youtube-dl` `mpeg` `mp4` `mkv`

---

<details open>
  <summary>Package: youtube-dl</summary>
  <h5>Downloader of videos from YouTube and other sites</h5>
  <p>
    youtube-dl is a small command-line program to download videos from
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
    <a href="https://rg3.github.com/youtube-dl/">Homepage</a>
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

> The -o option allows users to indicate a template for the output file names.

```shell
# OUTPUT TEMPLATES

$ youtube-dl -f mp4 -o '/tmp/%(title)s_[%(duration)0ds]_[%(id)s].%(ext)s' "https://www.youtube.com/watch?v=8QSl_t65wnw"
/tmp/Volcano Eruption Power Comparison_[318s]_[8QSl_t65wnw].mp4
```

## Examples ##

```shell
$ youtube-dl -f mp4 "https://www.youtube.com/watch?v=8QSl_t65wnw"
[youtube] 8QSl_t65wnw: Downloading webpage
[youtube] 8QSl_t65wnw: Downloading video info webpage
[youtube] 8QSl_t65wnw: Extracting video information
[download] Destination: Volcano Eruption Power Comparison-8QSl_t65wnw.mp4
[download] 100% of 17.47MiB in 01:09
```

```shell
$ youtube-dl -f mp4 -o '/tmp/%(title)s_%(id)s.%(ext)s' "https://www.youtube.com/watch?v=8QSl_t65wnw"
[download] Resuming download at byte 1108268
[download] Destination: /tmp/Volcano Eruption Power Comparison_8QSl_t65wnw.mp4
```

```shell
$ youtube-dl -f mp4 -o '/tmp/%(title)s_[%(duration)0ds]_[%(id)s].%(ext)s' "https://www.youtube.com/watch?v=8QSl_t65wnw"
[download] Destination: /tmp/Volcano Eruption Power Comparison_[318s]_[8QSl_t65wnw].mp4
```

---

:scorpius:
