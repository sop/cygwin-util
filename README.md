# Sop's Cygwin Utilities
These utilities provide support for executing `.sh` scripts in
[Cygwin](https://www.cygwin.com/) by double-clicking a file from
Windows explorer or dropping a file to `.sh` icon.

## Installation
Clone to a directory of choice (eg. `/opt/cygwin`) inside Cygwin:

    git clone https://github.com/sop/cygwin-util.git /opt/cygwin

Fix permissions:

    chmod +x /opt/cygwin/*.cmd /opt/cygwin/*.sh

Cygwin installation path is detected automatically when these utilities
are installed under the Cygwin's directory structure. If you install outside
Cygwin directory, a `CYGDIR` environment variable must be defined with a value
of Cygwin installation directory (eg. `C:\cygwin64`).

Execute `register-filetype.cmd` to add `.sh` file type into registry.

## Usage
You can write a script file with `.sh` extension and an interpreter
*(#! shebang)* of your choice.
Double-click a file from Windows explorer to have it executed in Cygwin shell.

You can also drag and drop a file to your `.sh` script.
Path of the dropped file is automatically translated to Cygwin path and passed
to your script as a first argument.

Example `drop.sh`:

    #!/bin/bash
    stat "$1"
    read -n 1 -s
