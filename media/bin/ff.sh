#!/usr/bin/env bash
##  ------------------------------------------------------------------------  ##
##                        ffmpeg user-defined functions                       ##
##  ------------------------------------------------------------------------  ##
#
#   Consist of:
#   -   showBanner
#   -   getDuration
#   -   showPalette

BD=./bin

##  -------------------------------- BANNER  -------------------------------  ##

function showBanner () {
  local SUFF="$1";
    if [ -z ${SUFF} ]; then
    SUFF=_default;
  fi
  local BANNER=${BD}/banner/${SUFF};
  if [ -f ${BANNER} ]; then
    cat ${BANNER};
    echo -ne "\n";
  fi
}

##  -------------------------  GET MEDIA DURATION  -------------------------  ##

function getDuration () {
  local F_IN="$1";
  if [ -f ${F_IN} ]; then
    local V_DURATION="$(ffmpeg -i ${F_IN} 2>&1 | grep Duration | cut -f4 -d' ' | cut -f1 -d',')";
    echo -ne "[$FUNCNAME] Media [${BWhite}${F_IN}${NC}]: ${BBlue}DURATION${NC} = ${BYellow}${V_DURATION}${NC} \n";
  fi
}

##  ----------  EXTRACT IMAGES FROM a MEDIA FILE EVERY <FREQ> seconds ------  ##

function ffThumbs () {
  showBanner "_bw";
  local F_IN="$1"
  local FREQ=$2

  local L=${#F_IN}
  local BASE=${F_IN:0:-4}
  local EXT=jpeg
  local PREF="${BASE}-thumb"

  if [ -z ${FREQ} ]; then FREQ=5; fi

  ffmpeg  -hide_banner \
          -i ${F_IN} \
          -r ${FREQ} \
          -f image2 \
          "${PREF}-%04d.${EXT}";

          # -s 640x640 \

  echo -ne "[$FUNCNAME] Media [${BWhite}${F_IN}${NC}] ${BBlue}THUMBS${NC} ${BYellow}READY${NC} \n";
}

##  ------------------  CREATE VIDEO FROM set of IMAGES  -------------------  ##

function ffThumbs () {
  showBanner "_bw";
  local F_IN="$1"
  local FREQ=$2

  local L=${#F_IN}
  local BASE=${F_IN:0:-4}
  local EXT=jpeg
  local PREF="${BASE}-thumb"

  if [ -z ${FREQ} ]; then FREQ=5; fi

  ffmpeg  -hide_banner \
          -i ${F_IN} \
          -r ${FREQ} \
          -f image2 \
          "${PREF}-%04d.${EXT}";

          # -s 640x640 \

  echo -ne "[$FUNCNAME] Media [${BWhite}${F_IN}${NC}] ${BBlue}THUMBS${NC} ${BYellow}READY${NC} \n";
}

##  ----------------------------  SHOW PALETTE  ----------------------------  ##

function showPalette () {
  echo -e "--------------------------------------------------------------------"
  echo "LINES BELOW MUST BE IN DIFFERENT COLORS:"
  echo -e "${BRed} BRed ${NC}"
  echo -e "${BGreen} BGreen ${NC}"
  echo -e "${BWhite} BWhite ${NC}"
  echo -e "${BPurple} BPurple ${NC}"
  echo -e "${BYellow} BYellow ${NC}"
  echo -e "${BCyan} BCyan ${NC}"
  echo -e "${BBlue} BBlue ${NC}"
  echo -e "--------------------------------------------------------------------"
}

##  --------------------  EOF: ffmpeg-functions.sh  ------------------------  ##
