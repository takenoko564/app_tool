#!/bin/sh

dname="${1}.imageset"
fname=$1
mkdir ${dname}

convert ${fname}.jpg -resize 100% $dname/${fname}_3.jpg
convert ${fname}.jpg -resize 66% $dname/${fname}_2.jpg
convert ${fname}.jpg -resize 33% $dname/${fname}_1.jpg

echo "{" > $dname/Contents.json
echo '  "images" : [' >> $dname/Contents.json
echo "    {" >> $dname/Contents.json
echo '      "idiom" : "universal",' >> $dname/Contents.json
echo '      "filename" : "'${fname}_1.jpg'",' >> $dname/Contents.json
echo '      "scale" : "1x"' >> $dname/Contents.json
echo "    }," >> $dname/Contents.json
echo "    {" >> $dname/Contents.json
echo '      "idiom" : "universal",' >> $dname/Contents.json
echo '      "filename" : "'${fname}_2.jpg'",' >> $dname/Contents.json
echo '      "scale" : "2x"' >> $dname/Contents.json
echo "    }," >> $dname/Contents.json
echo "    {" >> $dname/Contents.json
echo '      "idiom" : "universal",' >> $dname/Contents.json
echo '      "filename" : "'${fname}_3.jpg'",' >> $dname/Contents.json
echo '      "scale" : "3x"' >> $dname/Contents.json
echo "    }" >> $dname/Contents.json
echo '  ],' >> $dname/Contents.json
echo '  "info" : {' >> $dname/Contents.json
echo '    "version" : 1,' >> $dname/Contents.json
echo '    "author" : "xcode"' >> $dname/Contents.json
echo "  }" >> $dname/Contents.json
echo "}" >> $dname/Contents.json

rm ${1}.jpg

