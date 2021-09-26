#!/bin/bash

LIVE_NAME="";
PKGS_LIST="network-manager net-tools wireless-tools wpagui openssh-client icewm xserver-xorg-core xserver-xorg xinit xterm";

WALLPAPER_URL="";

apt update;
apt install -y --no-install-recommends linux-image-amd64 live-boot systemd-sysv;

apt install -y wget

apt install -y $PKGS_LIST;

mkdir ${HOME}/.icewm;
cp -prvv /usr/share/icewm/* ${HOME}/.icewm;
echo "Theme=\"win95/default.theme\"" > ${HOME}/.icewm/theme;
echo "prog \"Terminal\" utilities-terminal xterm -fg orange -bg black" > ${HOME}/.icewm/toolbar;
echo "prog \"Web browser\" ! x-www-browser" >> ${HOME}/.icewm/toolbar;

mkdir ${HOME}/.${LIVE_NAME};
wget $WALLPAPER_URL -O ${HOME}/.${LIVE_NAME}/${LIVE_NAME}_wallpaper;

echo "icewmbg --scaled=1 -p -i .${LIVE_NAME}/${LIVE_NAME}_wallpaper &" > ${HOME}/.xinitrc;
echo >> ${HOME}/.xinitrc;
echo "exec icewm-session" >> ${HOME}/.xinitrc;
cp ${HOME}/.xinitrc ${HOME}/.xession;

passwd root

exit
