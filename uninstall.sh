#!/bin/bash
# Uninstaller script for the instantOS GRUB theme

set -euo pipefail
IFS=$'\n\t'

[ "$USER" != 'root' ] && >&2 echo "$0: not running as root" && exit 1

echo 'uninstalling theme...'
rm -rvf /boot/grub/themes/instantos

echo 'updating grub config...'
grub_theme='/boot/grub/themes/instantos/theme.txt'
grep "^GRUB_THEME='$grub_theme'$" /etc/default/grub >/dev/null && {
    sed -i "\:$grub_theme:d" /etc/default/grub
    sed -i '/GRUB_THEME/s/^#//' /etc/default/grub
    echo 'reverted GRUB_THEME to previous in /etc/default/grub'
}

echo 'generating new grub.cfg...'
grub-mkconfig -o /boot/grub/grub.cfg

echo 'successfully uninstalled instantos grub theme'
