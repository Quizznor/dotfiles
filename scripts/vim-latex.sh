#!/usr/bin/env bash

DIRECTORY="$1"  # Directory of open file
FILENAME="$2"   # Filename (relative dir)

# get LaTeX root file, root directory for building and root pdf for viewing
FIRSTLINE=$(head -1 $FILENAME)

if [[ "$FIRSTLINE" =~ "%!TEX" ]]
then
  ROOT_PATH="$(echo $FIRSTLINE | awk '{print $4}')"
  ROOT_DIR=$(echo $ROOT_PATH | awk -F/ '!($3=""){gsub(" ","/");print}')
  ROOT_TEX=$(echo $ROOT_PATH | awk -F/ '{print $NF}')
  ROOT_PDF=$(echo "$DIRECTORY/$ROOT_DIR$ROOT_TEX" | sed 's/tex$/pdf/')
else
  ROOT_DIR="$DIRECTORY"
  ROOT_TEX="$FILENAME"
  ROOT_PDF=$(echo "$ROOT_DIR/$ROOT_TEX" | sed 's/tex$/pdf/')
fi

# build LaTeX root file...
(cd $ROOT_DIR && pdflatex $ROOT_TEX )      # Always build the document at least once
if [[ ! -z "$3" ]]                         # If desired, build with biber, etc.
then
  (cd $ROOT_DIR && biber $ROOT_TEX)
  (cd $ROOT_DIR && pdflatex $ROOT_TEX)
  (cd $ROOT_DIR && pdflatex $ROOT_TEX)
fi

# ...and view it
if [ ! $(pidof zathura) ]
then
  zathura $ROOT_PDF &
fi
