#!/bin/bash

# script's directory
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# temporary file for download
TMP=$(mktemp)
# check whether 64-bit or 32-bit installation
[[ $(uname -m) == "x86_64" ]] &&
    FILENAME="setup-x86_64.exe" || FILENAME="setup-x86.exe"
# destination filename
DEST="$DIR/$FILENAME"
# check that wget is installed
cygcheck wget &>/dev/null
if [[ $? -ne 0 ]]; then
    echo "Please install wget.";
    read -n 1 -s
    exit 1
fi
# download to temporary file
wget -O $TMP "https://cygwin.com/$FILENAME"
if [ $? -ne 0 ]; then
    echo "Failed to load $FILENAME."
    read -n 1 -s
    exit 1
fi
# move to destination
mv $TMP $DEST
# set executable permission
chmod +x $DEST
