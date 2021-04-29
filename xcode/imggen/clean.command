#!/bin/zsh

cd `dirname $0`
ls ./ | grep -v -E 'auto.command|clean.command|bin|readme.txt' | xargs rm -rf
exit
