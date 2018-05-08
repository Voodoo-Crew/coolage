# **BASH tools** to easy operate on media files #

![FFmpeg Logo Image](assets/img/ffmpeg-logo.png)


`audio` `video` `media` `capture` `video4linux2` `v4l` `v4l2` `v4l2-ctl` `v4l-utils` `mkv` `mp4`

---

## Capture video from video input device (e.g. car registrator) ##

Uses the `video4linux2` (or simply v4l2) input device to capture live input such as from a webcam. See the [v4l2 input device documentation](https://ffmpeg.org/ffmpeg-all.html#video4linux2_002c-v4l2) for more information.

**v4l2-ctl** — An application to control video4linux drivers

## List devices ##

To list the supported, connected capture devices you can use the `v4l-ctl` tool. This example shows connected webcam `/dev/video0`:

```shell
$ v4l2-ctl --list-devices
USB PC Camera              (usb-0000:00:1d.7-5.2):
        /dev/video0
```

## List device capabilities ##

To list available formats (supported pixel formats, video formats, and frame sizes) for a particular input device:

```shell
$ ffmpeg -hide_banner \
         -f v4l2 \
         -list_formats all \
         -i /dev/video0
```

Alternatively you could use `v4l2-ctl --list-formats-ext` to list available formats:

```shell
$ v4l2-ctl --list-formats-ext
ioctl: VIDIOC_ENUM_FMT
        Index       : 0
        Type        : Video Capture
        Pixel Format: 'MJPG' (compressed)
        Name        : Motion-JPEG
                Size: Discrete 1280x720
                        Interval: Stepwise 0.033s - 0.033s with step 0.000s (30.000-30.000 fps)
                Size: Discrete 640x480
                        Interval: Stepwise 0.033s - 0.033s with step 0.000s (30.000-30.000 fps)
                Size: Discrete 320x240
                        Interval: Stepwise 0.033s - 0.033s with step 0.000s (30.000-30.000 fps)
```

## Encoding example ##

Example to encode video from `/dev/video0`:

```shell
$ ffmpeg -hide_banner \
         -f v4l2 \
         -framerate 25 \
         -video_size 640x480 \
         -i /dev/video0 \
         /data/storage/shared/ftp/pub/videotest/test-record-output.mkv
```

---

:scorpius:
