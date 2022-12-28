#!/bin/bash
###
 # @Date: 2022-12-28 13:46:35
 # @LastEditors: Hernando lzhen.dev@outlook.com
 # @LastEditTime: 2022-12-28 13:49:07
 # @FilePath: \Rime\scripts\install_extended_dicts.sh
### 

# This script installs the extended dictionaries for the rime input method.
# should be run from the scripts path of the project
git clone https://github.com/rime-aca/dictionaries.git -o dictionaries


# Check the rime path by the OS version

Rime_Path="Unknown"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        Rime_Path=~/.config/ibus/rime
elif [[ "$OSTYPE" == "darwin"* ]]; then
        Rime_Path=~/Library/Rime
elif [[ "$OSTYPE" == "cygwin" ]]; then
        Rime_Path=$APPDATA/Rime
        # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
        Rime_Path=$APPDATA/Rime
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
        Rime_Path="Unknown"
elif [[ "$OSTYPE" == "freebsd" ]]; then
        # ...
        Rime_Path="Unknown"
else
        Rime_Path="Unknown"
        # Unknown.
fi

if [[ "$Rime_Path" == "Unknown" ]]; then
        echo "Unknown OS type"
        exit 1
fi

# Copy the dictionaries to the rime path
cp -r dictionaries/luna_pinyin.dict/*.dict.yaml $Rime_Path

    