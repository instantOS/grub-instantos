#!/bin/bash
# Build script for the instantOS GRUB theme

set -euo pipefail
IFS=$'\n\t'

tar -cvf instantos.tar.gz theme/*

echo 'successfully created a theme archive (intended for use with GRUB Customizer)'
