#!/bin/sh

# make a directory
# get absolute path
SCRIPT_PATH=$(pwd)
echo "当前脚本文件的绝对路径：$SCRIPT_PATH"

# get config path
CONFIG_PATH="$SCRIPT_PATH/.config"
echo "config path：$CONFIG_PATH"

# get yabai path
YABAI_PATH="$SCRIPT_PATH/.yabairc"
echo "yabai path：$YABAI_PATH"

SKHD_PATH="$SCRIPT_PATH/.skhdrc"
echo "skhd path：$SKHD_PATH"

# symbol link
echo "begin symbol link"

# backup config
mv ~/.config ~/.config_bak

ln -s $CONFIG_PATH ~/.config
ln -s $YABAI_PATH ~/.yabairc
ln -s $SKHD_PATH ~/.skhdrc

echo "finsh symbol link"
echo "start service"

skhd --start-service
yabai --start-service
