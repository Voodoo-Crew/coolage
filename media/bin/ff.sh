#!/usr/bin/env bash
##  ------------------------------------------------------------------------  ##
##                        ffmpeg user-defined functions                       ##
##  ------------------------------------------------------------------------  ##
#
#   Consist of:
#   -   showBanner
#   -   getDuration
#   -   ffThumbs
#   -   ffAnimate
#   -   ffSlideshow
#   -   showPalette

BD=./bin

##  -------------------------------- BANNER  -------------------------------  ##

function showBanner () {
  local SUFF="$1"
  if [ -z ${SUFF} ]; then SUFF=_default; fi
  local BANNER=${BD}/banner/${SUFF}
  if [ -f ${BANNER} ]; then cat ${BANNER}; fi
}

##  -------------------------  GET MEDIA DURATION  -------------------------  ##

function getDuration () {
  local F_IN="$1"
  if [ -f ${F_IN} ]; then
    local V_DURATION="$(ffprobe -hide_banner -i ${F_IN} 2>&1 | grep Duration | cut -f4 -d' ' | cut -f1 -d',')";
    echo -e "[${Blue}$FUNCNAME${NC}] Media \t [${Purple}${F_IN}${NC}] ${BGreen}DURATION${NC} = [${BYellow}${V_DURATION}${NC}]"
  fi
}

##  ----------  EXTRACT IMAGES FROM a MEDIA FILE EVERY <FREQ> seconds ------  ##

function ffThumbs () {
  showBanner;
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

  echo -ne "[${Blue}$FUNCNAME${NC}] Media [${BWhite}${F_IN}${NC}] ${BBlue}THUMBS${NC} ${BYellow}READY${NC} \n";
}

##  ------------------  CREATE VIDEO FROM set of IMAGES  -------------------  ##

function ffAnimate () {
  showBanner;
  local F_DIR="$1"

  local L=${#F_IN}
  local BASE=${F_IN:0:-4}
  local EXT=jpeg

  local PREF="animation"
  local F_MASK="${PREF}-*.${EXT}"
  local F_OUT="M1.avi"

  ffmpeg  -hide_banner \
          -r 15 \
          -f concat \
          -safe 0 \
          -i "./animate-images.txt" \
          -vf "fps=25,format=yuv420p" \
          -y ${F_OUT};

          # -vcodec mpeg4 \
          # -s 640x360 \

  # ffmpeg  -hide_banner \
  #         -framerate 10 \
  #         -pattern_type glob \
  #         -i "MOVI0000-thumb-*.jpeg" \
  #         -y ${F_OUT};

          # -f image2 \
          # -s 640x640 \

  echo -ne "[${Blue}$FUNCNAME${NC}] Media ready: [${BYellow}${F_OUT}${NC}] \n";
}

##  ------------------  CREATE VIDEO FROM set of IMAGES  -------------------  ##

function ffSlideshow () {
  showBanner;
  local F_DIR="$1"

  local L=${#F_IN}
  local BASE=${F_IN:0:-4}
  local EXT=jpeg

  local PREF="video-thumb"
  local F_MASK="${PREF}-*.${EXT}"
  local F_OUT="M1.avi"

  ffmpeg  -hide_banner \
          -r 10 \
          -f concat \
          -safe 0 \
          -i "./animate-images.txt" \
          -vf "fps=25,format=yuv420p" \
          -y ${F_OUT};

          # -vcodec mpeg4 \
          # -s 640x360 \

  # ffmpeg  -hide_banner \
  #         -framerate 10 \
  #         -pattern_type glob \
  #         -i "MOVI0247-Branches-thumb-*.jpeg" \
  #         -y ${F_OUT};

          # -f image2 \
          # -s 640x640 \

  echo -e "[${Blue}$FUNCNAME${NC}] Media ready: [${BYellow}${F_OUT}${NC}]";
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
