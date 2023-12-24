#!/bin/bash

opt="-all"

if [ "$1" = "-p" ] ; then
  opt="-png"
  shift
fi

if [ -z "$1" ] ; then
  echo "needs filename!"
  exit 1
fi

for f in "$@" ; do
  file=$(basename "$f")
  ext="${file##*.}"
  base="${file%.*}"
  mkdir "$base" && (cd "$base" && pdfimages "$opt" "../$file" "$base" && fdupes -Nd .)
done
