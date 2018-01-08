#!/usr/bin/env bash
##  ------------------------------------------------------------------------  ##
##               Cut one episod from video file and save it                   ##
##  ------------------------------------------------------------------------  ##
#
#   Consist of:
#   - usage
#   - ffCut

IN_FILE="$1"
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

    $0 <$IN_FILE> <OFFSET> <TS_END> - skip OFFSET seconds and stop at TS_END
      IN_FILE - input video file
      OFFSET  - skip timeframe before start transformation
      TS_END  - stop process at this point
EOM
}

##  --------------  CUT a video from OFFSET to TS_END  ---------------------  ##

function ffCut () {
  local F_SRC="$1"
  local OFFSET="$2"
  local TS_END="$3"
  local F_CNT="$4"

  local SUFF="cut"
  # showBanner ${SUFF}

  if [ -z ${F_CNT} ]; then
    F_CNT=$(date +"%s");
  fi

  local L=${#F_SRC}
  local BASE=${F_SRC:0:-4}
  local EXT=${F_SRC:L-3:L}
  local F_OUT="${BASE}-${SUFF}-${F_CNT}.${EXT}"
  local F_LOG="${F_SRC}.clips"

  echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}TIME_FRAME${NC}: \t [${Yellow}${OFFSET} - ${TS_END}${NC}]"

  ffmpeg  -hide_banner \
          -v 0 \
          -ss ${OFFSET} \
          -i ${F_SRC} \
          -to ${TS_END} \
          -c copy \
          -copyts \
          -y ${F_OUT} \
          2>&1 >/dev/null;

  echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}${On_Blue}OUTPUT FILE${NC}: \t [${Yellow}${F_OUT}${NC}]"
  echo "file '$(basename -- ${F_OUT})'" >> ${F_LOG}
  F_RESULT="${F_OUT}"

  getDuration "${F_RESULT}";
}

# $(if [ ! -z ${TS_END} ]; then printf %b "-to ${TS_END}"; fi) \

##  -----------  [TESTED] CUT a video from OFFSET to the END  --------------  ##
# ffmpeg -ss "${OFFSET}" -i "${IN_FILE}" -c copy -copyts -y "${OUT_FILE}"
##  ------------------------  EXAMPLE of EXECUTE  --------------------------  ##

TS_SS=$2;
TS_TO=$3;
TS_CNT=$4;

if [ -z ${TS_SS} ]; then TS_SS="00:00:00.00"; fi
if [ -z ${TS_TO} ]; then TS_TO="00:00:15.00"; fi
if [ -z ${TS_CNT} ]; then TS_CNT=$(date +"%S"); fi

# getDuration "${IN_FILE}";

# ffCut "${IN_FILE}" "${TS_SS}" "${TS_TO}" "${TS_CNT}";

if [ ! -z ${F_RESULT} ]; then getDuration "${F_RESULT}"; fi

# echo -e "\n\n ${BYellow} CUT Operation ${BGreen}${On_Black} COMPLETED ${NC} \n\n";
