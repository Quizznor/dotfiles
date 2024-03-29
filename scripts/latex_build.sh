#!/usr/bin/env bash

DIRECTORY=$(echo $1 | awk -F/ '{OFS=FS;$NF="";print}')  # Directory of open file
FILENAME=$(echo $1 | awk -F/ '{OFS=FS;print $NF}')      # Filename (relative dir)

# get LaTeX root file, root directory for building and root pdf for viewing
FIRSTLINE=$(head -1 $1 | tr -d ' ')

if [[ "$FIRSTLINE" =~ "%!TEX" ]]
then
  ROOT_PATH=$DIRECTORY/$( echo $FIRSTLINE | awk -F= '{print $2}')
  ROOT_TEX=$(echo $ROOT_PATH | awk -F/ '{OFS=FS;print $NF}')
  ROOT_DIR=$( echo $ROOT_PATH | xargs dirname)
else
  ROOT_DIR="$DIRECTORY"
  ROOT_TEX="$FILENAME"
fi

ROOT_PDF=$(echo "$ROOT_DIR/$ROOT_TEX" | sed 's/tex$/pdf/')

# build LaTeX root file...
if [ "$2" == "build" ]; then
  (cd $ROOT_DIR && pdflatex --shell-escape $ROOT_TEX )    # Always build the document at least once
  if [[ ! -z "$3" ]]                                      # If desired, build with biber, etc.
  then
    (cd $ROOT_DIR && biber ${ROOT_TEX%.*})                #  Run biber to create bibliography
    (cd $ROOT_DIR && pdflatex $ROOT_TEX)                  # Running pdflatex again to include bib
    (cd $ROOT_DIR && pdflatex $ROOT_TEX)                  # Idk, run it again to be sure
  fi

# show LaTex root pdf
elif [ "$2" == "open" ]; then
  nohup zathura $ROOT_PDF &
  sleep 0.3 && wmctrl -a "LaTeX-Editor"

elif [ "$2" == "clean" ]; then
  (cd $ROOT_DIR && rm -rf *.aux *.log *.bcf *.out *.toc *.xml *.ist *.glo *.bbl *.blg)
  rm -rf nohup.out
  killall zathura
fi