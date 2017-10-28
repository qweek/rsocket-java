#!/bin/bash

# https://github.com/facebook/infer/blob/master/INSTALL.md

PLATFORM=linux64
INFER=0.13.0
FILE=infer-$PLATFORM-v$INFER
USRDIR=$HOME/usr/local/lib/infer/infer/bin

echo "Download Infer file $FILE"
wget -q "https://github.com/facebook/infer/releases/download/v$INFER/$FILE.tar.xz"  -O - | tar -xJf - && cd $FILE

# TODO: move to infer-linux64-v0.13.0 to $HOME/usr/local/bin/infer ?
# TODO: cache
# TODO: ./configure --prefix=$HOME/usr/local first
# TODO: set $HOME/usr/local
# delete travis
# which ocaml

#echo "Create Usr directory $USRDIR"
#mkdir -p "$USRDIR"

#echo "Configure Infer prefix"
#INFER_CONFIGURE_OPTS="--prefix=$USRDIR"

echo "Compile Infer $INFER"
./build-infer.sh java

echo "Install Infer"
make install DESTDIR=$HOME

#echo "Add Infer to PATH"
#export PATH=`pwd`/infer/bin:$PATH
#type -a infer
#echo "Add Infer to PATH 2"
#export PATH=$USRDIR:$PATH
# which infer