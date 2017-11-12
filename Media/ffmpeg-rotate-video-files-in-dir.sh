#!/usr/bin/env bash
##  ------------------------------------------------------------------------  ##
##                 ROTATE VIDEO files by 90 degrees CLOCKWISE                 ##
##                    --->  WITHOUT LOSS of QUALITY  <---                     ##
##  ------------------------------------------------------------------------  ##
##  More ffmpeg options at https://ffmpeg.org/documentation.html              ##
##  ------------------------------------------------------------------------  ##

EX=".mp4"
for v in $(ls *${EX})
  do
    BASE="${v:0:-4}"
    IN="${BASE}${EX}"
    OUT="${BASE}-rotated90${EX}"
    printf "Processing:\t${IN}\t-->\t${OUT} ... ";
    ffmpeg -i "${IN}" -b:v 17M -vf "rotate='0*PI*t:c=none'" -y "${OUT}"
    printf "DONE!\n";
  done
