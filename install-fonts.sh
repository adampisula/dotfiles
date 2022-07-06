#!/bin/sh

cp -r ./fonts/* /usr/share/fonts
fc-cache -f
