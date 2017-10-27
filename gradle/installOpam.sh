#!/bin/bash

# http://opam.ocaml.org/doc/Install.html#Binarydistribution
# https://raw.githubusercontent.com/ocaml/opam/master/shell/opam_installer.sh

ARCH=$(uname -m) # x86_64
SYS=$(uname -s) # Linux
OPAM=1.2.2
OCAML=4.05.0
FILE=opam-$OPAM-$ARCH-$SYS
##BINDIR=$HOME/usr/local/bin/opam
BINDIR=/usr/local/bin

echo "Download Opam file $FILE"
wget -q "https://github.com/ocaml/opam/releases/download/$OPAM/$FILE"

echo "Create Bin directory $BINDIR"
mkdir -p "$BINDIR"

echo "Install Opam $OPAM"
install -m 755 $FILE $BINDIR/opam

echo "Init Ocaml $OCAML"
$BINDIR/opam init --compiler "$OCAML" --auto-setup                          #no-setup

echo "Config Opam env"
# $BINDIR/opam config env                                                   #eval
##$BINDIR/opam config setup --all
##export PATH=$BINDIR:$PATH                                                   #opam?

eval `$BINDIR/opam config env`