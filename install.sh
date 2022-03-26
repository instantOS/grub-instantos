#!/bin/bash
# Installer script for the instantOS GRUB theme

set -euo pipefail
IFS=$'\n\t'

[ $USER != 'root' ] && >&2 echo "$0: not running as root" && exit 1

echo 'installing theme...'
mkdir /boot/grub/themes/instantos ||:
cp -rv theme/* /boot/grub/themes/instantos/

echo 'updating grub config...'
grub_theme='/boot/grub/themes/instantos/theme.txt'
grep "^GRUB_THEME='$grub_theme'$" /etc/default/grub >/dev/null || { 
    sed -i '/GRUB_THEME/s/^/#/' /etc/default/grub
    sed -i "/GRUB_THEME/ a GRUB_THEME='$grub_theme'" /etc/default/grub
    echo 'changed GRUB_THEME to instantos in /etc/default/grub'
}

echo 'generating new grub.cfg...'
grub-mkconfig -o /boot/grub/grub.cfg

echo 'successfully installed instantos grub theme'
