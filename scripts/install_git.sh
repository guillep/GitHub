#! /bin/bash
set -ex
wget https://github.com/git/git/archive/v2.6.5.tar.gz
tar -xzvf v2.6.5.tar.gz
cd git-2.6.5
export NO_OPENSSL=1
export NO_GETTEXT=1
make
