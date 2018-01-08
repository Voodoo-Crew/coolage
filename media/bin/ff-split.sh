#!/usr/bin/env bash
##  ------------------------------------------------------------------------  ##
##                         SPLIT Media by Time Frames                         ##
##                    --->  WITHOUT LOSS of QUALITY  <---                     ##
##  ------------------------------------------------------------------------  ##
##  More info about ffmpeg at: http://ffmpeg.org/ffmpeg.html#Video-Options    ##
##  ------------------------------------------------------------------------  ##

#   Consist of:
#   -   usage
#   -   ffSplit()

IN_FILE="$1"
TS_FILE="$2"
F_RESULT=

##  SOURCES
BD=./bin
F_COL=${BD}/.bash_colors
F_FUNCS=${BD}/ff.sh
F_CUT=${BD}/ff-cut.sh


if [ -f ${F_COL} ]; then source ${F_COL}; fi
if [ -f ${F_FUNCS} ]; then source ${F_FUNCS}; fi
if [ -f ${F_CUT} ]; then source ${F_CUT}; fi


function usage () {
  >&2 cat << EOM
          Split media file into separate pieces

  Usage:
    $0 <command> [<params>] - command scheme

    ffSplit "<IN_FILE>" "<TS_FILE>"   - split media files into parts
      IN_FILE - input media file
      TS_FILE - file with timeframes that should be cutted from source
        each line in TS_FILE should be in format: [OFFSET - TS_END]
          , where
            - OFFSET - time to skip from beginning
            - TS_END - stop process at this point
EOM
}

##  --------------------------  SPLIT MEDIA FILE  --------------------------  ##

function ffSplit () {
  showBanner "split";
  local F_IN="$1"
  local F_TS="$2"

  local SUFF="clip"
  local BASE="${F_IN:0:-4}"
  local F_TPL="${BASE}-${SUFF}"
  local F_LOG="${F_IN}.clips"

  if [ -f ${F_LOG} ]; then rm -f ${F_LOG}; fi
  echo -e "## Source File: ${F_IN} ##" >> "${F_LOG}"

  echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}MEDIA_FILE${NC}: \t [${Yellow}${F_IN}${NC}]"
  echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}F_LOG${NC}: \t [${Yellow}${F_LOG}${NC}]"
  echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}TIMECODES${NC}: \t [${Yellow}${F_TS}${NC}]"
  # echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}SUFF${NC}: \t [${White}${SUFF}${NC}]"
  # echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}BASE${NC}: \t [${White}${BASE}${NC}]"
  # echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}F_TPL${NC}: \t [${Yellow}${F_TPL}${NC}]"

  local IC=0
  local TS_SS=
  local TS_TO=

  IFS=$'\n'       # make newlines the only separator
  set -f          # disable globbing

  for TC in $(cat < "${F_TS}");
    do
      IC=$((${IC} + 1))
      echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}PART${NC}: \t [${Yellow} ${IC} ${NC}]"

      TS_SS=$(echo "${TC}" | cut --delimiter=- --fields=1 | tr -d " ")
      TS_TO=$(echo "${TC}" | cut --delimiter=- --fields=2 | tr -d " ")

      # echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}TC${NC}: \t\t [${White} ${TC} ${NC}]"
      # echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}TS_SS${NC}: \t [${White} ${TS_SS} ${NC}]"
      # echo -e "[${Blue}$FUNCNAME${NC}] ${BCyan}TS_TO${NC}: \t [${White} ${TS_TO} ${NC}]"

      ffCut "${F_IN}" "${TS_SS}" "${TS_TO}" "${IC}"
    done
  unset IFS
  return 0
}

##  ------------------------  EXAMPLE of EXECUTE  --------------------------  ##

if [ -f ${IN_FILE} ]; then
  ffSplit "${IN_FILE}" "${TS_FILE}"
fi

echo -e "\n\n ${BYellow}SPLIT${NC} Operations ${BGreen}${On_Black}COMPLETED${NC}\n\n"
