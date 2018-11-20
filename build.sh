#!/bin/bash
mv ${HOME}/Downloads/ij\ timeline\ -\ Sheet1.csv ./
lua highlights.lua > render.sh
. render.sh
rm render.sh
cp *.png ${HOME}/Google\ Drive/I2K-2018/timeline/

