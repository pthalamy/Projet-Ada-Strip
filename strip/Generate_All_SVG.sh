#!/bin/sh

for I in `seq 1 16`
do
  echo $I
  ./strip zdf/zdf$I.txt Svg_Outputs/zdf$I.svg
  echo "\n"
done


