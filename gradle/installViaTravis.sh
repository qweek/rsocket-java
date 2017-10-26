#!/bin/bash

OPAM_VER=4.05.0
INFER_VER=0.13.0

# https://github.com/facebook/infer/blob/master/INSTALL.md#pre-compiled-versions
# echo "Installing Infer dependencies"
# sudo apt-get update
# sudo apt-get -o Dpkg::Options::="--force-confnew" upgrade -y
# sudo apt-get -o Dpkg::Options::="--force-confnew" install -y libffi-dev libmpc-dev libmpfr-dev python-software-properties
# installed on travis: autoconf automake build-essential libgmp-dev m4 pkg-config unzip zlib1g-dev

# http://opam.ocaml.org/doc/Install.html#Binarydistribution
# echo "Installing Opam"
# wget https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s $HOME/usr/local/bin ${OPAM_VER}

##echo "Downloading Infer"
##wget -q https://github.com/facebook/infer/releases/download/v${INFER_VER}/infer-linux64-v${INFER_VER}.tar.xz
##tar xf infer-linux64-v${INFER_VER}.tar.xz
##cd infer-linux64-v${INFER_VER}/

##echo "Compiling Infer"
##./build-infer.sh java

##echo "Installing Infer"
##sudo make install

##echo "Adding Infer to PATH"
##export PATH=`pwd`/infer/bin:$PATH

echo "Init vars"
arch=$(uname -m) # x86_64
sys=$(uname -s) # Linux
opam=1.2.2
ocaml=4.05.0
file=opam-$opam-$arch-$sys
dir=$HOME/usr/local/bin/opam

echo "Echo vars"
echo $arch
echo $sys
echo $opam
echo $ocaml
echo $file
echo $dir

echo "Download"
wget -q "https://github.com/ocaml/opam/releases/download/$opam/$file"

echo "Dir"
mkdir -p "$dir" # 2>/dev/null
echo "Install"
install -m 755 $file $dir/opam
echo "Remove"
rm -f $file
echo "Init"
$BINDIR/opam  init --comp "$ocaml"

# Install Opam
# wget https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s $HOME/usr/local/bin 4.05.0
# Download Infer
wget https://github.com/facebook/infer/releases/download/v0.13.0/infer-linux64-v0.13.0.tar.xz -q -O - | tar -xJf -
mv -u infer-linux64-v0.13.0 $HOME/.infer && cd $HOME/.infer
# Compile Infer
./build-infer.sh java
# Install Infer
./configure --prefix=$HOME
make install
# Add Infer to PATH
export PATH=`pwd`/infer/bin:$PATH