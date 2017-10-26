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
platform=linux64
opam=1.2.2
ocaml=4.05.0
infer=0.13.0
opamfile=opam-$opam-$arch-$sys
inferfile=infer-$platform-v$infer
bindir=$HOME/usr/local/bin
libdir=$HOME/usr/local/lib/infer

echo "Download Opam file $opamfile"
wget -q "https://github.com/ocaml/opam/releases/download/$opam/$opamfile"

echo "Create Bin directory $bindir"
mkdir -p "$bindir"

echo "Install Opam $opam to $bindir/opam"
install -m 755 $opamfile $bindir/opam

# $bindir/opam init --comp "$ocaml"

echo "Add Opam to PATH"
export PATH=$bindir:$PATH


echo "Create Infer directory $inferdir"
mkdir -p "$inferdir"

echo "Download Infer file $inferfile"
wget -q "https://github.com/facebook/infer/releases/download/v$infer/$inferfile.tar.xz"  -O - | tar -xJf -

echo "Compile Infer version $infer"
cd $inferfile
./build-infer.sh java

echo "Install Infer prefix $HOME"
./configure --prefix=$HOME
make install

echo "Add Infer to PATH"
export PATH=`pwd`/infer/bin:$PATH

# Install Opam
# wget https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s $HOME/usr/local/bin 4.05.0
# Download Infer
# wget https://github.com/facebook/infer/releases/download/v0.13.0/infer-linux64-v0.13.0.tar.xz -q -O - | tar -xJf -
# mv -u infer-linux64-v0.13.0 $HOME/.infer && cd $HOME/.infer
# Compile Infer
#./build-infer.sh java
# Install Infer
#./configure --prefix=$HOME
#make install
# Add Infer to PATH
#export PATH=`pwd`/infer/bin:$PATH