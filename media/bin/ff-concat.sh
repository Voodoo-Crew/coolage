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

##  ------------------  CONCAT VIDEO FILES INTO ONE  -----------------------  ##

function ffConcat () {
  showBanner "concat"
  local F_LIST="$1"
  local F_OUT="$2"
  if [ -z ${F_LIST} ] || [ ! -f ${F_LIST} ]; then
    echo -e "[${Blue}$FUNCNAME${NC}] ${BRed}CANNOT PROCEED with F_LIST${NC}: \t [${Yellow}${F_LIST}${NC}]"
    exit 1
  fi

  if [ -z ${F_OUT} ]; then
    local L=${#F_LIST}
    local BASE=${F_LIST:0:-8}
    local EXT=${F_LIST:L-7:3}
    F_OUT="${BASE}.concat.${EXT}"
  fi

  echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}FILES_LIST${NC}: \t [${Yellow}${F_LIST}${NC}]"

  ffmpeg  -hide_banner \
          -f concat \
          -safe 0 \
          -i "${F_LIST}" \
          -c copy \
          -y "${F_OUT}" ;

          # -v 1 \

  echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}${On_Blue}OUTPUT${NC}: \t [${Yellow}${F_OUT}${NC}]"
  F_RESULT="${F_OUT}"
  echo -ne "\n\n ${BYellow} CONCAT Operation ${BGreen}${On_Black}COMPLETED${NC}\n\n"
}

##  ------------------------  EXAMPLE of EXECUTE  --------------------------  ##

ffConcat "${LIST_FILE}" "${F_OUTPUT}"

if [ ! -z ${F_RESULT} ]; then
  getDuration "${F_RESULT}"
fi

# echo -ne "\n\n ${BYellow} Concat Operations ${BGreen}${On_Black}COMPLETED${NC}\n\n";
