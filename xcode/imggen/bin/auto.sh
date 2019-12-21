#!/bin/sh

for file in `\find . -maxdepth 1 -type f`; do
if [ `echo $file | grep '.png'` ] ; then
    preopt=${file#./}
    opt=${preopt%.png}
    sh ./bin/gen_png.sh $opt
fi
if [ `echo $file | grep '.jpg'` ] ; then
    preopt=${file#./}
    opt=${preopt%.jpg}
    sh ./bin/gen_jpg.sh $opt
fi
done
