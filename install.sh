#!/bin/sh

dir=$(echo $HOME)/Projects/dotfiles

# XRESOURCES
ln -sf $dir/Xresources ~/.Xresources

# BASH FILES
ln -sf $dir/bash_aliases ~/.bash_aliases
ln -sf $dir/bash_motd ~/.bash_motd
ln -sf $dir/bash_profile ~/.bash_profile
ln -sf $dir/bashrc ~/.bashrc

# CONFIG FILES
ln -sf $dir/config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf $dir/config/i3/config ~/.config/i3/config
ln -sf $dir/config/lsd/config.yaml ~/.config/lsd/config.yaml
ln -sf $dir/config/picom/picom.conf ~/.config/picom/picom.conf

ln -sf $dir/config/polybar/config ~/.config/polybar/config
ln -sf $dir/config/polybar/launch.sh ~/.config/polybar/launch.sh
chmod +x $dir/config/polybar/launch.sh

ln -sf $dir/config/rofi/clean.rasi ~/.config/rofi/clean.rasi
ln -sf $dir/config/rofi/colors.rasi ~/.config/rofi/colors.rasi
ln -sf $dir/config/rofi/music-launcher.rasi ~/.config/rofi/music-launcher.rasi
ln -sf $dir/config/rofi/powermenu.rasi ~/.config/rofi/powermenu.rasi

# SCRIPTS
ln -sf $dir/Scripts/display-color.py ~/Scripts/display-color.py
chmod +x $dir/Scripts/display-color.py

ln -sf $dir/Scripts/lock.sh ~/Scripts/lock.sh
chmod +x $dir/Scripts/lock.sh

ln -sf $dir/Scripts/multihead.sh ~/Scripts/multihead.sh
chmod +x $dir/Scripts/multihead.sh

ln -sft $dir/Scripts/misc ~/Scripts/
chmod +x $dir/Scripts/misc/*

ln -sft $dir/Scripts/music ~/Scripts/
chmod +x $dir/Scripts/music/*

ln -sft $dir/Scripts/rofi ~/Scripts/
chmod +x $dir/Scripts/rofi/*

# PICTURES
cp -r $dir/Pictures/* ~/Pictures/
