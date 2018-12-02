#!/bin/bash

CONFIGFILE="/etc/ssh/sshd_config"
BACKUPFILE="$CONFIGFILE.bak"

echo "[INFO] SSH on Debian"
echo "[INFO] Installation..."
apt in -y openssh-server
systemctl enable openssh-server

echo "[INFO] Configuration..."

cp $CONFIGFILE $BACKUPFILE
sed 's/^#PermitRootLogin yes/PermitRootLogin yes/g' $BACKUPFILE > $CONFIGFILE
systemctl restart openssh-server