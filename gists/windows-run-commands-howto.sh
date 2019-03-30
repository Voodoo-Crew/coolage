#!/usr/bin/env bash

FROM=$(basename "$0")
EXT="md"

BASE=${FROM%.*}
F_SRC="${BASE}.${EXT}"
F_TMP="${BASE}.tmp"
F_OUT="${BASE}-flexed.${EXT}"

echo "FROM = ${FROM}"
echo "BASE = ${BASE}"
echo "F_SRC = ${F_SRC}"
echo "F_TMP = ${F_TMP}"
echo "F_OUT = ${F_OUT}"

echo -e "| Command | Invoke |\n\r|:--------|:-------|" > ${F_TMP}
sed '/^#/d' ${F_SRC} | awk -F "\t" '{print "| " $2 " | " $1}' >> ${F_TMP}

cat ${F_TMP} > ${F_OUT}
cat ${F_OUT}
