#!/bin/sh

echo -e "\e[33mInfer\e[0m"

# https://github.com/facebook/infer/blob/master/INSTALL.md#pre-compiled-versions
echo "Installing Infer dependencies"
sudo apt-get update
sudo apt-get -o Dpkg::Options::="--force-confnew" upgrade -y
sudo apt-get -o Dpkg::Options::="--force-confnew" install -y  \
#  autoconf \
#  automake \
#  build-essential \
  libffi-dev \
#  libgmp-dev \
  libmpc-dev \
  libmpfr-dev \
#  m4 \
#  pkg-config \
  python-software-properties
#  unzip \
#  zlib1g-dev


# http://opam.ocaml.org/doc/Install.html#Binarydistribution
echo "Installing Opam"
wget https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin  4.05.0

echo "Downloading Infer"
wget -q https://github.com/facebook/infer/releases/download/v0.13.0/infer-linux64-v0.13.0.tar.xz
tar xf infer-linux64-v0.13.0.tar.xz
cd infer-linux64-v0.13.0/

echo "Compiling Infer"
./build-infer.sh java

echo "Installing Infer"
sudo make install

echo "Adding Infer to PATH"
export PATH=`pwd`/infer/bin:$PATH