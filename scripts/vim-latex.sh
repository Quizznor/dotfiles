#!/usr/bin/env bash

DIRECTORY=$(echo $1 | awk -F/ '{OFS=FS;$NF="";print}')  # Directory of open file
FILENAME=$(echo $1 | awk -F/ '{OFS=FS;print $NF}')      # Filename (relative dir)

# get LaTeX root file, root directory for building and root pdf for viewing
FIRSTLINE=$(head -1 $1)

if [[ "$FIRSTLINE" =~ "%!TEX" ]]
then
  ROOT_PATH="$(echo $FIRSTLINE | awk '{print $4}')"
  ROOT_DIR=$(echo "$DIRECTORY$ROOT_PATH" | awk -F/ '{OFS=FS;$NF="";print}')
  ROOT_TEX=$(echo $ROOT_PATH | awk -F/ '{OFS=FS;print $NF}')
  ROOT_PDF=$(echo "$ROOT_DIR$ROOT_TEX" | sed 's/tex$/pdf/')
else
  ROOT_DIR="$DIRECTORY"
  ROOT_TEX="$FILENAME"
  ROOT_PDF=$(echo "$ROOT_DIR$ROOT_TEX" | sed 's/tex$/pdf/')
fi

# build LaTeX root file...
(cd $ROOT_DIR && pdflatex $ROOT_TEX )      # Always build the document at least once
if [[ ! -z "$2" ]]                         # If desired, build with biber, etc.
then
  (cd $ROOT_DIR && biber $ROOT_TEX)        # Run biber to create bibliography
  (cd $ROOT_DIR && pdflatex $ROOT_TEX)     # Running pdflatex again to include bib
  # (cd $ROOT_DIR && pdflatex $ROOT_TEX)     # Idk, run it again to be sure
fi

# cleanup all auxiliary files
(cd $ROOT_DIR && rm -rf *.aux *.log *.bbl *.blg *.bcf *.out *.toc *.xml)

# ...and view it
if [ ! $(pidof zathura) ]
then
  zathura $ROOT_PDF &
fi
