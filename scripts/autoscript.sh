#!/usr/bin/env bash

if [ -z $1 ]
then
  echo "Bad script name. Please try again"
  exit
fi


if [ -z $2 ]
then
  SCRIPT="$HOME/.config/scripts/$1"
else
  case $1 in
  "sh")
  SHEBANG="#!/usr/bin/env bash\n\n"
  ;;
  "py")
  SHEBANG="#!/usr/bin/env python\n\n"
  ;;
  esac
  SCRIPT="$HOME/.config/scripts/$2.$1"
fi

touch $SCRIPT

if [[ ! -z "$SHEBANG" ]]
then
  printf "$SHEBANG" > $SCRIPT
fi

chmod +x $SCRIPT
mv-coding.sh
atom $SCRIPT
