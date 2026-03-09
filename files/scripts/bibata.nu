#!/usr/libexec/bluebuild/nu/nu


http get https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata.tar.xz | save /tmp/Bibata.tar.xz

cd /tmp/

tar -xvf Bibata.tar.xz

mv Bibata-* /usr/share/icons/
