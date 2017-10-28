#!/bin/bash

# http://opam.ocaml.org/doc/Install.html

ARCH=$(uname -m) # x86_64
SYS=$(uname -s) # Linux
OPAM=1.2.2
OCAML=4.05.0
FILE=opam-$OPAM-$ARCH-$SYS

if [ -d "$OPAM_DIR" ]; then
  echo "Dir $OPAM_DIR exists"
else
  echo "Dir $OPAM_DIR not exists"
fi

echo "Download file $FILE"
wget -q "https://github.com/ocaml/opam/releases/download/$OPAM/$FILE"

echo "Create directory $OPAM_DIR"
mkdir -p "$OPAM_DIR"

echo "Install Opam $OPAM"
install -m 755 $FILE $OPAM_DIR/opam

echo "Remove temporary file $FILE"
rm -fv $FILE

# echo "Init Ocaml $OCAML"
# $OPAM_DIR/opam init --compiler "$OCAML" --no-setup