#!/usr/bin/env bash

echo "tell application \"System Events\" to tell every desktop to set picture to \"$WALLPAPER\""
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$WALLPAPER\""
