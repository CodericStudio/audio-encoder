#!/bin/bash

input="$@"
concatInput=$(printf ",%s" "${input[@]}")
concatInput=${concatInput:1}

fileName=$concatInput
fileNameWithoutExtension=$(basename "$fileName" | sed -e 's/\.[^.]*$//')

audioPath="/drop/temp-out/$fileNameWithoutExtension.mp3"
videoPath="/drop/in/$fileName"

ffmpeg -i "$videoPath" "$audioPath"
mv "$audioPath" "/drop/out/$fileNameWithoutExtension.mp3"
