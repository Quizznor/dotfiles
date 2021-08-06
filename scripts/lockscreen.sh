#!/usr/bin/env bash

# init xautolock
if [ -z $1 ]; then

  xautolock -corners +00- -cornerdelay 0 -cornerredelay 4 -time 1 -cornersize 10 \
  -locker "$HOME/.config/scripts/lockscreen.sh --nofork -- scrot -z -o -d 1"

else

  # don't run locker if currently focused window is in fullscreen
  FOCUSED=$(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $NF}')
  if xprop -id ${FOCUSED} _NET_WM_STATE | grep -q _NET_WM_STATE_FULLSCREEN; then
    exit 1
  else

    set -o errexit -o noclobber -o nounset

    hue=(-level "0%,100%,0.6")
    effect=(-filter Gaussian -resize 20% -define "filter:sigma=1.5" -resize 500.5%)
    # default system sans-serif font
    font=$(convert -list font | awk "{ a[NR] = \$2 } /family: $(fc-match sans -f "%{family}\n")/ { print a[NR-1]; exit }")
    image=$(mktemp --suffix=.png)
    shot=(import -window root)
    desktop=""
    i3lock_cmd=(i3lock -i "$image")
    shot_custom=false

    # move pipefail down as for some reason "convert -list font" returns 1
    set -o pipefail
    trap 'rm -f "$image"' EXIT
    temp="$(getopt -o :hdnpglt:f: -l desktop,help,listfonts,nofork,pixelate,greyscale,text:,font: --name "$0" -- "$@")"
    eval set -- "$temp"
    text=""

    while true ; do
        case "$1" in
            -d|--desktop) desktop=$(command -V wmctrl) ; shift ;;
            -g|--greyscale) hue=(-level "0%,100%,0.6" -set colorspace Gray -average) ; shift ;;
            -p|--pixelate) effect=(-scale 10% -scale 1000%) ; shift ;;
            -f|--font)
                case "$2" in
                    "") shift 2 ;;
                    *) font=$2 ; shift 2 ;;
                esac ;;
            -t|--text) text=$2 ; shift 2 ;;
            -l|--listfonts)
    	    convert -list font | awk -F: '/Font: / { print $2 }' | sort -du | command -- ${PAGER:-less}
    	    exit 0 ;;
    	-n|--nofork) i3lock_cmd+=(--nofork) ; shift ;;
            --) shift; shot_custom=true; break ;;
            *) echo "error" ; exit 1 ;;
        esac
    done

    if "$shot_custom" && [[ $# -gt 0 ]]; then
        shot=("$@");
    fi

    command -- "${shot[@]}" "$image"

    value="60" #brightness value to compare to

    color=$(convert "$image" -gravity center -crop 100x100+0+0 +repage -colorspace hsb \
        -resize 1x1 txt:- | awk -F '[%$]' 'NR==2{gsub(",",""); printf "%.0f\n", $(NF-1)}');

    bw="white"
    icon="/home/quizznor/documents/lock.png"
    param=("--inside-color=00000000" "--ring-color=35707f" "--bshl-color=d18031"\
        "--line-color=ffffff00" "--keyhl-color=d18031" "--ringver-color=00000000" \
        "--separator-color=00000000" "--insidever-color=00000000" \
        "--ringwrong-color=35707f" "--insidewrong-color=00000000" \
        "--verif-color=00000000" "--wrong-color=00000000" "--time-color=00000000" \
        "--date-color=00000000" "--layout-color=00000000" "--radius=83" "--ring-width=15")

    convert "$image" "${hue[@]}" "${effect[@]}" -font "$font" -pointsize 26 -fill "$bw" -gravity center \
        -annotate +0+160 "$text" "$icon" -gravity center -composite "$image"

    # If invoked with -d/--desktop, we'll attempt to minimize all windows (ie. show
    # the desktop) before locking.
    ${desktop} ${desktop:+-k on}

    # try to use i3lock with prepared parameters
    if ! "${i3lock_cmd[@]}" "${param[@]}" >/dev/null 2>&1; then
        # We have failed, lets get back to stock one
        "${i3lock_cmd[@]}"
    fi

    # As above, if we were passed -d/--desktop, we'll attempt to restore all windows
    # after unlocking.
    ${desktop} ${desktop:+-k off}
  fi

fi
