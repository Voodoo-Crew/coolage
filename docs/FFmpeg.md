# Installing FFmpeg #

[FFmpeg Official](http://ffmpeg.org)

## 1. Install dependencies ##

```shell
$ sudo apt-get install  \
  -y                    \
  libfreetype6          \
  libfreetype6-dev      \
  libfont-freetype-perl \
  vflib3                \
  libfribidi-dev        \
  libx264-dev           \
  libavutil-dev         \
  libass-dev            \
  libmp3lame-dev        \
  libflite1             \
;
```
<!--/ libopenjpeg-dev /-->

```shell
$ sudo apt install \
  -y               \
  libopenjp2-7     \
  libopenjp2-7-dev \
  libopenjp2-tools \
;
```

```shell
$ sudo apt install \
  -y         \
  libvpx7    \
  libvpx-dev \
  vpx-tools  \
;
```

### Extended version from [MLT framework documentation](https://www.mltframework.org/docs/buildscripts/) ###

```shell
$ sudo apt-get install  \
  -y                    \
  git                   \
  automake              \
  autoconf              \
  libtool               \
  intltool              \
  g++                   \
  yasm                  \
  swig                  \
  libmp3lame-dev        \
  libgavl-dev           \
  libsamplerate-dev     \
  libxml2-dev           \
  ladspa-sdk            \
  libjack-dev           \
  libsox-dev            \
  libsdl1.2-dev         \
  libgtk2.0-dev         \
  libsoup2.4-dev        \
  libexif-dev           \
  libtheora-dev         \
  libvdpau-dev          \
  libvorbis-dev         \
  python2-dev           \
;
```
<!--/ libqt4-dev /-->

## 2. Download sources ##

```shell
$ mkdir -p /opt/git
$ cd /opt/git
```

```shell
# origin (recommended)
$ git clone git://source.ffmpeg.org/ffmpeg.git

# github mirror
$ git clone https://github.com/FFmpeg/FFmpeg ffmpeg
```

```shell
$ cd ffmpeg
```

## 3. Configure ##

Type `./configure` to create the configuration. A list of configure
options is printed by running `configure --help`.

```shell
$ ./configure               \
  --enable-gpl              \
  --enable-filter=drawtext  \
  --enable-filter=drawgrid  \
  --enable-libopenjpeg      \
  --enable-libfreetype      \
  --enable-libfribidi       \
  --enable-libx264          \
  --enable-libass           \
  --enable-libmp3lame       \
  --enable-libvpx           \
;
```

`configure` can be launched from a directory different from the FFmpeg
sources to build the objects out of tree. To do this, use an absolute
path when launching `configure`, e.g. `/ffmpeg-dir/ffmpeg/configure`.

## 4. Build ##

### 4.1 ###
Build FFmpeg. GNU Make 3.81 or later is required.

```shell
$ make
```

### 4.2 ###
Install all binaries and libraries you built.

```shell
$ make install
```

NOTICE
- Non system dependencies (e.g. libx264, libvpx) are disabled by default.

---

:scorpius:
