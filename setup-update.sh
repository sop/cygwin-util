#!/bin/bash

# script's directory
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# check that wget is installed
cygcheck wget &>/dev/null
if [[ $? -ne 0 ]]; then
    echo "Please install wget."
    exit 1
fi
pushd . >/dev/null
# find /bin directory
while [[ "$PWD" != '/' ]] && [[ ! -f "$PWD/bin/uname" ]]; do cd ..; done
# check whether 64-bit or 32-bit installation
[[ $(./bin/uname -m) == "x86_64" ]] &&
    FILENAME="setup-x86_64.exe" || FILENAME="setup-x86.exe"
popd >/dev/null
# destination filename
DEST="$DIR/$FILENAME"
# download to temporary file
TMP=$(mktemp)
wget -O $TMP "https://cygwin.com/$FILENAME"
if [ $? -ne 0 ]; then
    echo "Failed to download $FILENAME."
    exit 1
fi
# move to destination
mv $TMP $DEST
# set executable permission
chmod +x $DEST
