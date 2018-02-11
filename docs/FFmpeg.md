# Installing FFmpeg #

[FFmpeg Official](http://ffmpeg.org)

## 1. Install dependencies ##

```shell
$ sudo apt-get install -y             \
                libfreetype6          \
                libfreetype6-dev      \
                libfont-freetype-perl \
                vflib3                \
                libfribidi-dev        \
                libopenjpeg-dev       \
                libx264-dev           \
                libavutil-dev         \
                libass-dev            \
                libmp3lame-dev
```

## 2. Download sources ##

```shell
$ git clone git://source.ffmpeg.org/ffmpeg.git        # origin
$ git clone https://github.com/FFmpeg/FFmpeg ffmpeg   # github-mirror
$ cd ffmpeg
```

## 3. Configure ##

Type `./configure` to create the configuration. A list of configure
options is printed by running `configure --help`.

```shell
$ ./configure --enable-gpl              \
              --enable-filter=drawtext  \
              --enable-filter=drawgrid  \
              --enable-libopenjpeg      \
              --enable-libfreetype      \
              --enable-libfribidi       \
              --enable-libx264          \
              --enable-libass           \
              --enable-libmp3lame
```

  `configure` can be launched from a directory different from the FFmpeg
sources to build the objects out of tree. To do this, use an absolute
path when launching `configure`, e.g. `/ffmpeg-dir/ffmpeg/configure`.

## 4. Build ##

4.1 Type `make` to build FFmpeg. GNU Make 3.81 or later is required.
4.2 Type `make install` to install all binaries and libraries you built.

NOTICE
---

 - Non system dependencies (e.g. libx264, libvpx) are disabled by default.

---

:scorpius:
