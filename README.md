# tcdprint-cups

Installation script for TCD_Mobile Datapac printers

This script is for installing TCD_Mobile printing configuration on Linux machines. It should work with any machine which has `cups` installed but this is not tested.

## Prerequisites

* `cups`
  * Debian/Ubuntu: `sudo apt install cups`
  * Arch Linux: `sudo pacman -S cups`
  * If your distribution is not listed here, you can easily search for it online.

## Executing the script

1. Allow executable permissions: `chmod +x install-printer.sh`
2. Run script: `./install-printer.sh <student number> <PIN>`
