#!/bin/sh

# Check dokumentation for more info about Infer installation on Linux
# https://github.com/facebook/infer/blob/master/INSTALL.md#pre-compiled-versions

# opam >= 1.2.0
# Python 2.7 <-- preinstalled in Travis
# pkg-config
# libffi >= 3.0
# Java (only needed for the Java analysis) <-- preinstalled in Travis
# gcc >= 4.7.2 or clang >= 3.1 (only needed for the C/Objective-C analysis) <-- preinstalled in Travis
# autoconf >= 2.63 and automake >= 1.11.1 (if building from git)

echo -e "\e[33mInstalling Infer dependencies\e[0m"
sudo apt-get update
sudo apt-get -o Dpkg::Options::="--force-confnew" upgrade -y
sudo apt-get -o Dpkg::Options::="--force-confnew" install -y  \
  autoconf \
  automake \
  build-essential \
  libffi-dev \
  libgmp-dev \
  libmpc-dev \
  libmpfr-dev \
  m4 \
  pkg-config \
  python-software-properties \
  unzip \
  zlib1g-dev
#  software-properties-common \
#  ocaml \
#  ocaml-native-compilers \
#  camlp4-extra \
#  opam
#echo -e "Update Opam"
#opam update
#echo -e "Init Opam"
#opam init

#  autoconf \                    # 2.69-6
#  automake \                    # 1:1.14.1-2ubuntu1
#  build-essential \             # 11.6ubuntu6
#  libffi-dev \                  # ^ 3.1~rc1+r3.0.13-12ubuntu0.2
#  libgmp-dev \                  # 2:5.1.3+dfsg-1ubuntu1
#  libmpc-dev \                  # + 1.0.1-1ubuntu1
#  libmpfr-dev \                 # + 3.1.2-1
#  m4 \                          # 1.4.17-2ubuntu1
#  pkg-config \                  # 0.26-1ubuntu4
#  python-software-properties \  # + 0.92.37.8
#  unzip \                       # 6.0-9ubuntu1.5
#  zlib1g-dev \                  # 1:1.2.8.dfsg-1ubuntu1
#  software-properties-common \  # 0.92.37.8
#  ocaml \                       # + 4.01.0-3ubuntu3.1
#  ocaml-native-compilers \      # + 4.01.0-3ubuntu3.1
#  camlp4-extra \                # + 4.01.0-3ubuntu3.1
#  opam                          # + 1.1.1-1

# Opam is broken on some Ubuntu versions
# Install Opam from official repository (http://opam.ocaml.org/doc/Install.html#Binarydistribution)
echo -e "\e[33mInstalling Opam\e[0m"
# yes '' | sudo add-apt-repository ppa:avsm/ppa
# sudo apt-get update
# sudo apt-get install -y ocaml ocaml-native-compilers camlp4-extra opam
# 301 wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin
# wget https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin
wget https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin  4.04.0
# latest version 4.05.0
# sh ./opam_installer.sh /usr/local/bin 4.04.0

# Checkout Infer
#echo -e "\e[33mCloning Infer from Github\e[0m"
#git clone https://github.com/facebook/infer.git infer-sources
#cd infer-sources
# Compile Infer
#echo -e "\e[33mCompiling Infer\e[0m"
#./build-infer.sh --no-opam-lock java
# Install Infer into your PATH
#echo -e "\e[33mAdding Infer to PATH\e[0m"
#export PATH=`pwd`/infer/bin:$PATH

echo -e "\e[33mCloning Infer from Github\e[0m"
wget -q https://github.com/facebook/infer/releases/download/v0.12.1/infer-linux64-v0.12.1.tar.xz
tar xf infer-linux64-v0.12.1.tar.xz
cd infer-linux64-v0.12.1/
#echo -e "\e[33mCompiling Opam\e[0m"
#./build-infer.sh --only-install-opam
echo -e "\e[33mCompiling Infer\e[0m"
./build-infer.sh java
echo -e "\e[33mInstalling Infer\e[0m"
sudo make install
echo -e "\e[33mAdding Infer to PATH\e[0m"
export PATH=`pwd`/infer/bin:$PATH
#infer -v