#!/bin/bash
#
# Proxy to Java interpreter with Cygwin to Windows path translation.
#

# get the first 'java' binary found from PATH that is not this script
java_bin=$(which -a java 2>/dev/null | xargs readlink -e |
    grep -v "$(readlink -f "$0")" | head -n1)
if [[ -z "$java_bin" ]]; then
    >&2 echo "Java not found"
    exit 1
fi
# translate paths in arguments
declare -a newargs
for arg in "$@"; do
    # if argument starts with '/cygdrive/'
    if [[ "$arg" == /cygdrive/* ]]; then
        # translate to Win path
        arg="$(cygpath -w "$arg")"
    # if long argument with a parameter
    elif [[ "$arg" == --*=* ]]; then
        # if parameter starts with '/cygdrive/'
        if [[ "${arg#--*=}" == /cygdrive/* ]]; then
            # translate to Win path
            arg="${arg%%=*}=$(cygpath -w "${arg#--*=}")"
        fi
    fi
    newargs+=("$arg")
done
# invoke java
"$java_bin" "${newargs[@]}"
