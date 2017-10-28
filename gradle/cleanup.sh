#!/bin/bash

echo "Remove changes detected in cache"
rm -f  $HOME/.gradle/caches/*/fileHashes/fileHashes.*
rm -fr $HOME/.gradle/caches/*/plugin-resolution/
rm -f  $HOME/.gradle/caches/modules-2/modules-2.lock
rm -f  $HOME/.gradle/caches/user-id.txt.lock