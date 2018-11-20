#!/bin/bash

newsheet="$HOME/Downloads/ij timeline - Sheet1.csv"
destination="$HOME/Google Drive/I2K-2018/timeline"

if [ -f "$newsheet" ]; then mv "$newsheet" ./; fi
lua highlights.lua > render.sh
. render.sh
if [ -d "$destination" ]; then cp *.png "$destination/"; fi
