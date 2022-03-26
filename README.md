# instantOS GRUB theme

The bootloader theme for instantOS

### grub-customizer installation
```
git clone https://github.com/instantOS/grub-instantos
cd grub-instantos
sudo ./build.sh
```
`build.sh` will create `instantos.tar.gz`, which you can then use in GRUB Customizer.

### automatic installation
```
sudo ./install.sh
```
`install.sh` will install the theme, automatically update the GRUB_THEME variable in /etc/default/grub and comment out the existing one, and generate a new grub.cfg with the instantOS theme.

### uninstallation
```
sudo ./uninstall.sh
```
`uninstall.sh` will uninstall the theme, automatically revert the GRUB_THEME variable in /etc/default/grub back to the commented-out value, and generate a new grub.cfg with the previous theme.
