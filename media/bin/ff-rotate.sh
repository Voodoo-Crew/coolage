#!/usr/bin/env bash
##  ------------------------------------------------------------------------  ##
##               ROTATE VIDEO file by ANGLE degrees CLOCKWISE                 ##
##                   --->  WITHOUT LOSS of QUALITY  <---                      ##
##  ------------------------------------------------------------------------  ##
##  More info about ffmpeg at official site: https://ffmpeg.org               ##
##  ------------------------------------------------------------------------  ##
#
#   Consist of:
#   -   usage
#   -   ffRotate

IN_FILE="$1"
ANGLE=$2
if [ -z ${ANGLE} ]; then
  ANGLE=90
fi
RADS="${ANGLE}*PI/180"
F_RESULT=

##  SOURCES
BD=./bin
F_COL=${BD}/.bash_colors
F_FUNCS=${BD}/ff.sh

if [ -f ${F_COL} ]; then source ${F_COL}; fi
if [ -f ${F_FUNCS} ]; then source ${F_FUNCS}; fi

function usage () {
  >&2 cat << EOM
            Rotate video file by <ANGLE> degrees

  Usage:
    $0 <command> [<params>] - command scheme

    ffRotate <IN_FILE> <ANGLE> - rotate video by ANGLE degrees
      IN_FILE - input media file
      ANGLE   - degrees value to rotate CLOCKWISE. Default to 90deg
EOM
}

showBanner "rotate";

##  ---------------------  DO NOT EDIT BELOW THIS LINE  --------------------  ##
function ffRotate () {
  local F_IN="$1"
  local ANGLE=$2
  if [ -z ${ANGLE} ]; then ANGLE=90; fi
  local RADS="${ANGLE}*PI/180"
  local SUFF=rotated
  local L=${#F_IN}
  local BASE=${F_IN:0:-4}
  local EXT=${F_IN:L-3:L}
  local F_OUT="${BASE}-${SUFF}-${ANGLE}deg.${EXT}"

  echo -ne "[$FUNCNAME]${BCyan}IN_FILE${NC}: \t [${BYellow} ${IN_FILE} ${NC}] \n";
  echo -ne "[$FUNCNAME]${BCyan}ANGLE${NC}: \t [${BYellow} ${ANGLE} ${NC}] \n";
  echo -ne "[$FUNCNAME]${BCyan}RADS${NC}: \t [${BYellow} ${RADS} ${NC}] \n";

  ##  1920x1080p
  ffmpeg  -hide_banner \
          -i "${IN_FILE}" \
          -b:v 17M \
          -vf "rotate='${RADS}:c=none'" \
          -metadata title="This media was processed in ff-tools studio ..." \
          -y ${F_OUT} 2>&1 >/dev/null;

  echo -ne "[$FUNCNAME]${BCyan}${On_Blue}OUTPUT${NC}: \t\t [${BWhite}${F_OUT}${NC}] \n";
  F_RESULT="${F_OUT}";
}

##  640x480p
# ffmpeg -i input.mp4 -b:v 2547K -vf "rotate='0*PI*t:c=none'" -y output-rotate.mp4

##  ------------------------  EXAMPLE of EXECUTE  --------------------------  ##

getDuration "${IN_FILE}"

ffRotate "${IN_FILE}" "${ANGLE}"

if [ ! -z ${F_RESULT} ]; then
  getDuration "${F_RESULT}";
fi

echo -ne "\n\n ${BYellow} ALL Operations ${BGreen}${On_Black} COMPLETED ${NC} \n\n";
