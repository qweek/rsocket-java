#!/bin/bash

# http://opam.ocaml.org/doc/Install.html

ARCH=$(uname -m) # x86_64
SYS=$(uname -s) # Linux
OPAM=1.2.2
OCAML=4.05.0
FILE=opam-$OPAM-$ARCH-$SYS
BINDIR=$HOME/usr/local/bin/opam

if [ -d "$HOME/usr/local/bin/opam" ]; then
  echo "Dir $HOME/usr/local/bin/opam exists"
  if [ -f "$HOME/usr/local/bin/opam/opam" ]; then
    echo "File $HOME/usr/local/bin/opam/opam exists"
  else
    echo "File $HOME/usr/local/bin/opam/opam not exists"
  fi
else
  echo "Dir $HOME/usr/local/bin/opam not exists"
fi

echo "Download Opam file $FILE"
wget -q "https://github.com/ocaml/opam/releases/download/$OPAM/$FILE"

echo "Create Bin directory $BINDIR"
mkdir -p "$BINDIR"

echo "Install Opam $OPAM"
install -m 755 $FILE $BINDIR/opam

echo "Remove temporary file $FILE"
rm -f $FILE

# echo "Init Ocaml $OCAML"
# $BINDIR/opam init --compiler "$OCAML" --no-setup

#echo "Add Opam to PATH"
#export PATH=$BINDIR:$PATH