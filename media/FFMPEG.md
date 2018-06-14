# **BASH tools** to easy operate on media files #

![FFmpeg Logo Image](assets/img/ffmpeg-logo.png)

`audio` `video` `media` `cut` `trim` `concat` `rotate` `split` `join` `ffmpeg` `mp3`

---

![Cut banner](assets/banner/cut.svg)

## Cutting small sections ##

[Wiki Page]("https://trac.ffmpeg.org/wiki/Seeking#Cuttingsmallsections")

To extract only a small segment in the middle of a movie, it can be used in combination
with -t which specifies the duration, like -ss 60 -t 10 to capture from second 60 to 70. Or you can use the -to option to specify an out point, like -ss 60 -to 70 to capture from second 60 to 70. -t and -to are mutually exclusive. If you use both, -t will be used.

Note that if you specify -ss before -i only, the timestamps will be reset to zero, so -t and -to have not the same effect.
If you want to keep the original timestamps, add the -copyts option.

The first command will cut from 00:01:00 to 00:03:00 (in the original), using the faster seek. <br />
The second command will cut from 00:01:00 to 00:02:00, as intended, using the slower seek. <br />
The third command will cut from 00:01:00 to 00:02:00, as intended, using the faster seek.

```shell
$ ffmpeg -ss 00:01:00 -i video.mp4 -to 00:02:00 -c copy cut.mp4
$ ffmpeg -i video.mp4 -ss 00:01:00 -to 00:02:00 -c copy cut.mp4
$ ffmpeg -ss 00:01:00 -i video.mp4 -to 00:02:00 -c copy -copyts cut.mp4
```

---

## ![Trim banner](assets/banner/trim.svg) ##

Use ffmpeg to trim an audio file without re-encoding it.

```shell
# Trim starting from 10 seconds and end at 16 seconds (total time 6 seconds)
$ ffmpeg -i input.mp3 -ss 10 -t 6 -acodec copy output.mp3

# Trim from 00:02:54.583 to end of file
$ ffmpeg -i input.mp3 -ss 00:02:54.583 -acodec copy output.mp3

# Trim from 00:02:54.583 for 5 minutes (aka 300 seconds)
$ ffmpeg -i input.mp3 -ss 00:02:54.583 -t 300 -acodec copy output.mp3
```

---

## ![Split banner](assets/banner/split.svg) ##

TBD

---

## ![Concatenate banner](assets/banner/concat.svg) ##

[Wiki Page](https://trac.ffmpeg.org/wiki/Concatenate)

### Concatenation of files with same codecs ###

#### Concat demuxer ####
The concat demuxer was added to FFmpeg 1.1. You can read about it in the [documentation](https://ffmpeg.org/ffmpeg-formats.html#concat).

##### Instructions #####
Create a file **files-list.txt** with all the files you want to have concatenated in the following form (lines starting with a # are ignored):

```shell
$ cat files-list.txt
## List of mediafiles to concatenate ##
file '/path/to/file1.mp4'
file '/path/to/file2.mp4'
file '/path/to/file3.mp4'
```
Note that these can be either relative or absolute paths.

Then you can stream copy or re-encode your files:
```shell
$ ffmpeg -f concat -safe 0 -i files-list.txt -c copy output
```
The `-safe 0` above is not required if the paths are relative.

---

## ![Rotate banner](assets/banner/rotate.svg) ##

TBD

---

## ![Join banner](assets/banner/join.svg) ##

TBD

---

## Bitstream Filters ##

```shell
$ ffmpeg -i INPUT -c:v copy -bsf:v filter1[=opt1=str1:opt2=str2][,filter2] OUTPUT
```

---

:scorpius:
