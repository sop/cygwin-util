# Sop's Cygwin Utilities
These utilities add support for executing `.sh` scripts in
[Cygwin](https://www.cygwin.com/) by double-clicking a file from
Windows explorer or dropping a file to `.sh` icon.

## Installation
Clone to `/opt/cygwin` directory (inside Cygwin):

    git clone https://github.com/sop/cygwin-util.git /opt/cygwin

Fix permissions:

    chmod +x /opt/cygwin/*.cmd /opt/cygwin/*.sh

If your Cygwin installation directory differs from the default (`C:\cygwin`), edit the following files:
* `scriptrun.cmd` line 9: `SET CYGPATH=<cygwin path>`
* `script-filetype.reg` line 8: `@="<icon path>,0"`
* `script-filetype.reg` line 16: `@="\"<path to scriptrun.cmd>" \"%1\" %*"`

Double-click `script-filetype.reg` to add `.sh` file extension to registry.
