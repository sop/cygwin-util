#!/bin/bash
#
# See http://article.gmane.org/gmane.os.cygwin.ports.general/1292 for
# available mirrors.
#

# script's directory
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
pushd . >/dev/null
# find /bin directory
while [[ "$PWD" != '/' ]] && [[ ! -f "$PWD/bin/uname" ]]; do cd ..; done
# check whether 64-bit or 32-bit installation
[[ $(./bin/uname -m) == "x86_64" ]] &&
    SETUP="$DIR/setup-x86_64.exe" || SETUP="$DIR/setup-x86.exe"
popd >/dev/null
# start setup in Windows
CMD /C "START $(cygpath -w "$SETUP") -K http://cygwinports.org/ports.gpg"
