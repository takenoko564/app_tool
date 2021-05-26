#!/bin/sh

name="icon"
mkdir ${name}

convert $1 -resize 1024x1024 $name/${name}_1024.png

convert $1 -resize 29x29 $name/${name}_29x1.png
convert $1 -resize 58x58 $name/${name}_29x2.png
convert $1 -resize 87x87 $name/${name}_29x3.png

convert $1 -resize 20x20 $name/${name}_20x1.png
convert $1 -resize 40x40 $name/${name}_20x2.png
convert $1 -resize 60x60 $name/${name}_20x3.png

convert $1 -resize 40x40 $name/${name}_40x1.png
convert $1 -resize 80x80 $name/${name}_40x2.png
convert $1 -resize 120x120 $name/${name}_40x3.png

convert $1 -resize 60x60 $name/${name}_60x1.png
convert $1 -resize 120x120 $name/${name}_60x2.png
convert $1 -resize 180x180 $name/${name}_60x3.png

convert $1 -resize 76x76 $name/${name}_76x1.png
convert $1 -resize 152x152 $name/${name}_76x2.png

convert $1 -resize 167x167 $name/${name}_83_5x2.png



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
