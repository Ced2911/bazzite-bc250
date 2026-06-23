#!/usr/bin/env bash
set -oue pipefail

# 1. Déterminer la version exacte du noyau présent dans l'image
KERNELRELEASE=$(rpm -q kernel-core --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')
echo "Target Kernel Release: $KERNELRELEASE"

# 2. Cloner le dépôt
cd /tmp
git clone https://github.com/RinCat/RTL88x2BU-Linux-Driver
cd RTL88x2BU-Linux-Driver

# 3. Blacklister le pilote natif rtw88 qui entre en conflit
mkdir -p /etc/modprobe.d
echo "blacklist rtw88_8822bu" > /etc/modprobe.d/rtw8822bu.conf

# 4. Compiler et installer pour la bonne version du noyau
# On passe KVER_HOST à Make pour lui injecter la version extraite via rpm
make KVER_HOST="$KERNELRELEASE"
make install KVER_HOST="$KERNELRELEASE"
