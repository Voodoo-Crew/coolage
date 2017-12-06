#!/usr/bin/env bash
##  ------------------------------------------------------------------------  ##
##               Cut a part of video file into new file                       ##
##  ------------------------------------------------------------------------  ##
#
#   Consist of:
#   -   usage
#   -   ffCut

IN_FILE=$1
F_RESULT=

##  SOURCES
BD=./bin
F_COL=${BD}/.bash_colors
F_FUNCS=${BD}/ff.sh

if [ -f ${F_COL} ]; then source ${F_COL}; fi
if [ -f ${F_FUNCS} ]; then source ${F_FUNCS}; fi

function usage () {
  >&2 cat << EOM
            Cut part of video file by OFFSET and TS_END

  ${BYellow}Usage:${NC}
    $0 <command> [<params>] - command scheme

    $0 <IN_FILE> <OFFSET> <TS_END> - skip OFFSET seconds and stop at TS_END
      IN_FILE - input video file
      OFFSET  - skip timeframe before start transformation
      TS_END  - stop process at this point

EOM
}

showBanner "cut";

##  ---------------------  DO NOT EDIT BELOW THIS LINE  --------------------  ##


# printf "${BCyan}${On_Blue}IN_FILE${NC}: \t\t [${BCyan} ${IN_FILE} ${NC}]\n"


##  --------------  CUT a video from OFFSET to TS_END  ---------------------  ##
function ffCut () {
  local F_IN="$1";
  local OFFSET="$2";
  local TS_END="$3";
  local F_CNT="$4";

  if [ -z ${F_CNT} ]; then
    F_CNT=$(date +"%s");
  fi

  local L=${#F_IN};
  local BASE=${F_IN:0:-4};
  local EXT=${F_IN:L-3:L};
  local F_OUT="${BASE}-cut-${F_CNT}.${EXT}";

  echo -ne "[$FUNCNAME]${BCyan}TIME_FRAME${NC}: \t [${BYellow}${OFFSET} - ${TS_END}${NC}] \n";

  ffmpeg  -hide_banner \
          -ss "${OFFSET}" \
          -i "${F_IN}" \
          [ -z ${TS_END} ] ; then -to "${TS_END}"; fi \
          -c copy \
          -copyts \
          -y ${F_OUT} 2>&1 >/dev/null;

  echo -ne "[$FUNCNAME]${BCyan}${On_Blue}OUTPUT${NC}: \t\t [${BWhite}${F_OUT}${NC}] \n";
  F_RESULT="${F_OUT}";
}

##  -----------  [TESTED] CUT a video from OFFSET to the END  --------------  ##
# ffmpeg -ss "${OFFSET}" -i "${IN_FILE}" -c copy -copyts -y "${OUT_FILE}"
##  ------------------------  EXAMPLE of EXECUTE  --------------------------  ##

TS_SS=$2;
TS_TO=$3;
TS_CNT=$4;

if [ -z ${TS_SS} ]; then TS_SS="00:00:00.000"; fi
if [ -z ${TS_TO} ]; then TS_TO="00:00:15.000"; fi
if [ -z ${TS_CNT} ]; then TS_CNT=$(date +"%S"); fi

getDuration "${IN_FILE}";

ffCut "${IN_FILE}" "${TS_SS}" "${TS_TO}" "${TS_CNT}";

if [ ! -z ${F_RESULT} ]; then
  getDuration "${F_RESULT}";
fi

echo -ne "\n\n ${BYellow} ALL Operations ${BGreen}${On_Black} COMPLETED ${NC} \n\n";
