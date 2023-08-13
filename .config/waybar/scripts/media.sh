#!/bin/sh

status=$(playerctl status 2> /dev/null)
response=
if [ "$status" = "Playing" ]; then
    response+=" "  
elif [ "$status" = "Paused" ]; then
    response+=" "  
else
    exit 0
fi

metadata=$(playerctl metadata --format "{{ title }} - {{ artist }}" 2> /dev/null | recode ..html)

if [ -n "$metadata" ]; then
    response+="$metadata"
    echo "${response}" 
fi


