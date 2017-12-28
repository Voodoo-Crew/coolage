# media/Concat/concat-media-files.sh #
-----

```bash
$ ffmpeg -f concat -safe 0 -i "${LIST_FILE}" -c copy -y "${OUT_FILE}" 2>&1 >/dev/null
```
