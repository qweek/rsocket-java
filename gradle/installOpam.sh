#!/bin/bash

# http://opam.ocaml.org/doc/Install.html#Binarydistribution
# https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh

ARCH=$(uname -m) # x86_64
SYS=$(uname -s) # Linux
OPAM=1.2.2
OCAML=4.05.0
FILE=opam-$OPAM-$ARCH-$SYS
BINDIR=$HOME/usr/local/bin/opam
##BINDIR=/usr/local/bin

echo "Download Opam file $FILE"
wget -q "https://github.com/ocaml/opam/releases/download/$OPAM/$FILE"

echo "Create Bin directory $BINDIR"
mkdir -p "$BINDIR"

echo "Install Opam $OPAM"
install -m 755 $FILE $BINDIR/opam

###echo "Init Ocaml $OCAML"
###$BINDIR/opam init --compiler "$OCAML" --auto-setup                          #no-setup

echo "Config Opam env"
# $BINDIR/opam config env                                                   #eval
##$BINDIR/opam config setup --all
export PATH=$BINDIR:$PATH                                                   #opam?

###eval `$BINDIR/opam config env`

#echo "Config Opam env 2"
which opam
#which opam >/dev/null 2>&1
#if ! which opam >/dev/null 2>&1; then
#    echo "dependency not found: fuck"
#fi

#echo "Config Opam env 3"

PLATFORM=linux64
INFER=0.13.0
IFILE=infer-$PLATFORM-v$INFER
LIBDIR=$HOME/usr/local/lib

echo "Download Infer file $IFILE"
wget -q "https://github.com/facebook/infer/releases/download/v$INFER/$IFILE.tar.xz"  -O - | tar -xJf - && cd $IFILE

echo "Compile Infer $INFER"
./build-infer.sh java

echo "Create Lib directory $LIBDIR"
mkdir -p "$LIBDIR"

echo "Install Infer prefix $LIBDIR"
./configure --prefix=$HOME/usr/local && make install # make

echo "Add Infer to PATH"
export PATH=`pwd`/infer/bin:$PATH
which infer