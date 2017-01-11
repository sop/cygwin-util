#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
TMP=$(mktemp)
DEST="$DIR/setup-x86.exe"

wget -O $TMP "http://cygwin.com/setup-x86.exe"
if [ $? -ne 0 ]; then
    echo "Failed to load setup executable"
    exit 1
fi

mv $TMP $DEST
chmod +x $DEST

exit 0
