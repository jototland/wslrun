# wslrun

## Purpose

Run wsl commands seamlessly from windows without worrying about backslashes,
drive letters, and different paths.

## Contents:
  * An `install.sh` script. (It should be run from wsl)
  * The `linux/wslrun` python script, running on the linux side
  * The `windows/wslr.cmd` batch script, running on windows side.
  * Several (identical) batch scripts for commonly used linux commands,
    e.g. `windows/grep.cmd`, running on windows side.
    (all those scripts are identical,
    and can simply be copied if you need a new one)
  * An `addtowinpath.ps1` script to update windows path:
    It ensure  ~/bin is in the users path (ran by installation script)

## Usage:

First, install from wsl with `install.sh`.

From windows, run linux commands prefixed with `wslr`.
Or directly, using short identical scripts, such as `grep.cmd`.

## Example:

After installation, on windows side, running the command:
 ```
    wslr ls -l C:\foo
```
the `wslr.cmd` script will then run:
 ```
    wsl --exec wslrun ls -l C:\foo
```
On the linux side, `wslrun` will then run:
 ```
    ls -l /mnt/c/foo
```
