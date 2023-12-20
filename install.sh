#!/bin/sh

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

# WRAP_PATH="$SCRIPT_PATH/.inputrc"
# echo "skhd path：$WRAP_PATH"

# target path

# symbol link
echo "begin symbol link"

ln -s $CONFIG_PATH ~/.config
ln -s $YABAI_PATH ~/.yabairc
ln -s $SKHD_PATH ~/.skhdrc
# ln -s $WRAP_PATH ~/.inputrc

echo "finsh symbol link"
