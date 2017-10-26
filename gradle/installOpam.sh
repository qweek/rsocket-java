#!/bin/bash

# http://opam.ocaml.org/doc/Install.html#Binarydistribution
# https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh

ARCH=$(uname -m) # x86_64
SYS=$(uname -s) # Linux
OPAM=1.2.2
OCAML=4.05.0
FILE=opam-$OPAM-$ARCH-$SYS
BINDIR=$HOME/usr/local/bin

echo "Download Opam file $FILE"
wget -q "https://github.com/ocaml/opam/releases/download/$OPAM/$FILE"

echo "Create Bin directory $BINDIR"
mkdir -p "$BINDIR"

echo "Install Opam $OPAM to $BINDIR/opam"
install -m 755 $FILE $BINDIR/opam

# $BINDIR/opam init --comp "$OCAML"

echo "Add Opam to PATH"
export PATH=$BINDIR/opam:$PATH