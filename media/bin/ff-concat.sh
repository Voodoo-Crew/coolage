#!/usr/bin/env bash
##  ------------------------------------------------------------------------  ##
##               Concat several media files into new one                      ##
##  ------------------------------------------------------------------------  ##
##  Consist of:
##   - usage
##   - ffConcat
##  ------------------------------------------------------------------------  ##

LIST_FILE="$1"
F_OUTPUT="$2"
F_RESULT=

##  SOURCES
BD=./bin
F_COL=${BD}/.bash_colors
F_FUNCS=${BD}/ff.sh

if [ -f ${F_COL} ]; then source ${F_COL}; fi
if [ -f ${F_FUNCS} ]; then source ${F_FUNCS}; fi

showBanner "concat";

##  ------------------  CONCAT VIDEO FILES INTO ONE  -----------------------  ##

function ffConcat () {
  local F_LIST="$1";
  local F_OUT="$2";
  if [ -z ${F_LIST} || ! -f ${F_LIST} ]; then
    echo -ne "[$FUNCNAME]${BRed}CANNOT PROCEED with F_LIST${NC} = \t [${BYellow}${F_LIST}${NC}]\n";
    exit 1;
  fi

  if [ -z ${F_OUT} ]; then
    local L=${#F_LIST};
    local BASE=${F_LIST:0:-8};
    local EXT=${F_LIST:L-7:3};
    F_OUT="${BASE}.concat.${EXT}";
  fi

  echo -ne "${BCyan}FILES_LIST${NC}: \t [${BWhite}${F_LIST}${NC}]\n";

  ffmpeg  -hide_banner \
          -f concat \
          -safe 0 \
          -i "${F_LIST}" \
          -c copy \
          -y "${F_OUT}" 2>&1 >/dev/null;

          # -loglevel 0 \

  echo -ne "${BCyan}${On_Blue}OUTPUT${NC}: \t\t [${BWhite}${F_OUT}${NC}] \n";
  F_RESULT="${F_OUT}";
}

##  ------------------------  EXAMPLE of EXECUTE  --------------------------  ##

ffConcat "${LIST_FILE}" "${F_OUTPUT}";

if [ ! -z ${F_RESULT} ]; then
  getDuration "${F_RESULT}";
fi

echo -ne "\n\n ${BYellow} ALL Operations ${BGreen}${On_Black}COMPLETED${NC}\n\n";
