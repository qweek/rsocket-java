#!/bin/bash

# https://github.com/facebook/infer/blob/master/INSTALL.md

PLATFORM=linux64
INFER=0.13.0
FILE=infer-$PLATFORM-v$INFER
LIBDIR=$HOME/usr/local/lib

echo "Download Infer file $FILE"
wget -q "https://github.com/facebook/infer/releases/download/v$INFER/$FILE.tar.xz"  -O - | tar -xJf - && cd $FILE

# move to infer-linux64-v0.13.0 to $HOME/usr/local/bin/infer ?

echo "Compile Infer $INFER"
./build-infer.sh java

#echo "Create Lib directory $LIBDIR"
#mkdir -p "$LIBDIR"

#echo "Install Infer prefix $LIBDIR"
#./configure --prefix=$HOME && make install # make

echo "Add Infer to PATH"
export PATH=`pwd`/infer/bin:$PATH
which infer