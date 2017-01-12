# Sop's Cygwin Utilities
These utilities add support for executing `.sh` scripts in
[Cygwin](https://www.cygwin.com/) by double-clicking a file from
Windows explorer or dropping a file to `.sh` icon.

## Installation
Clone to `/opt/cygwin` directory (inside Cygwin):

    git clone https://github.com/sop/cygwin-util.git /opt/cygwin

Fix permissions:

    chmod +x /opt/cygwin/*.cmd /opt/cygwin/*.sh

Double-click `script-filetype.reg` to add `.sh` file extension to registry.
