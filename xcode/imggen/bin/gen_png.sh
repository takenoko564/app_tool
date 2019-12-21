#!/bin/sh

dname="${1}.imageset"
fname=$1
mkdir ${dname}

convert ${fname}.png -resize 100% $dname/${fname}_3.png
convert ${fname}.png -resize 66% $dname/${fname}_2.png
convert ${fname}.png -resize 33% $dname/${fname}_1.png

echo "{" > $dname/Contents.json
echo '  "images" : [' >> $dname/Contents.json
echo "    {" >> $dname/Contents.json
echo '      "idiom" : "universal",' >> $dname/Contents.json
echo '      "filename" : "'${fname}_1.png'",' >> $dname/Contents.json
echo '      "scale" : "1x"' >> $dname/Contents.json
echo "    }," >> $dname/Contents.json
echo "    {" >> $dname/Contents.json
echo '      "idiom" : "universal",' >> $dname/Contents.json
echo '      "filename" : "'${fname}_2.png'",' >> $dname/Contents.json
echo '      "scale" : "2x"' >> $dname/Contents.json
echo "    }," >> $dname/Contents.json
echo "    {" >> $dname/Contents.json
echo '      "idiom" : "universal",' >> $dname/Contents.json
echo '      "filename" : "'${fname}_3.png'",' >> $dname/Contents.json
echo '      "scale" : "3x"' >> $dname/Contents.json
echo "    }" >> $dname/Contents.json
echo '  ],' >> $dname/Contents.json
echo '  "info" : {' >> $dname/Contents.json
echo '    "version" : 1,' >> $dname/Contents.json
echo '    "author" : "xcode"' >> $dname/Contents.json
echo "  }" >> $dname/Contents.json
echo "}" >> $dname/Contents.json

rm ${1}.png

#convert $1 -resize 58x58 $name/iphone_ios_5_6_spotlight_and_settings_ios5_8@2x.png
#convert $1 -resize 87x87 $name/iphone_ios_5_6_spotlight_and_settings_ios5_8@3x.png

#convert $1 -resize 80x80 $name/iphone_ios_7_8_spotlight@2x.png
#convert $1 -resize 120x120 $name/iphone_ios_7_8_spotlight@3x.png

#convert $1 -resize 120x120 $name/appicon@2x.png
#convert $1 -resize 180x180 $name/appicon@3x.png

#convert $1 -resize 29x29 $name/ipad_ios_5_8_settings@1x.png
#convert $1 -resize 58x58 $name/ipad_ios_5_8_settings@2x.png

#convert $1 -resize 40x40 $name/ipad_ios_7_8_spotlight@1x.png
#convert $1 -resize 80x80 $name/ipad_ios_7_8_spotlight@2x.png

#convert $1 -resize 76x76 $name/ipad_app_icon@1x.png
#convert $1 -resize 152x152 $name/ipad_app_icon@2x.png
