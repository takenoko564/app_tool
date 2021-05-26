#!/bin/sh

name="thum"
mkdir ${name}

## 1242×2208
convert $1 -resize 1242x2208  $name/${name}_5p5_a.png
convert $1 -resize 1242x2208^ $name/${name}_5p5_b.png
convert $name/${name}_5p5_a.png -gravity center -extent 1242x2688  $name/${name}_5p5_a.png
convert $name/${name}_5p5_b.png -gravity center -extent 1242x2688  $name/${name}_5p5_b.png

## 1242×2688
convert $1 -resize 1242x2688  $name/${name}_6p5_a.png
convert $1 -resize 1242x2688^ $name/${name}_6p5_b.png
convert $name/${name}_6p5_a.png -gravity center -extent 1242x2688  $name/${name}_6p5_a.png
convert $name/${name}_6p5_b.png -gravity center -extent 1242x2688  $name/${name}_6p5_b.png

## 2048×2732
convert $1 -resize 2048x2732  $name/${name}_12p9_a.png
convert $1 -resize 2048x2732^ $name/${name}_12p9_b.png
convert $name/${name}_12p9_a.png -gravity center -extent 2048x2732  $name/${name}_12p9_a.png
convert $name/${name}_12p9_b.png -gravity center -extent 2048x2732  $name/${name}_12p9_b.png
