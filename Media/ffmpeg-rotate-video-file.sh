#!/usr/bin/env bash
##  ------------------------------------------------------------------------  ##
##                  ROTATE VIDEO file within ffmpeg examples                  ##
##                    --->  WITHOUT LOSS of QUALITY  <---                     ##
##  ------------------------------------------------------------------------  ##
##  More info about ffmpeg at official site: https://ffmpeg.org               ##
##  ------------------------------------------------------------------------  ##

##  1920x1080p
ffmpeg -i input.mp4 -b:v 17M -vf "rotate='0*PI*t:c=none'" -y output-rotate.mp4

##  640x480p
ffmpeg -i input.mp4 -b:v 2547K -vf "rotate='0*PI*t:c=none'" -y output-rotate.mp4
