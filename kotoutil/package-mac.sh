#!/bin/bash

VERSION=${VERSION:-`git describe --tags`}
ZIPDIR="Koto-${VERSION}-Mac"

cd `dirname $0`
set -e

mkdir -p tmp
cd tmp

if [ -d koto-swing-wallet-ui ]; then
  rm -rf koto-swing-wallet-ui
fi
git clone https://github.com/KotoDevelopers/koto-swing-wallet-ui.git
cd koto-swing-wallet-ui
ant -buildfile src/build/build.xml
cd ..

mkdir -p $ZIPDIR
mkdir -p $ZIPDIR/koto-bin

cp -r ../mac/* $ZIPDIR
cp koto-swing-wallet-ui/build/jars/KotoSwingWalletUI.jar $ZIPDIR/KotoWallet.app/Contents/MacOS
cp ../../src/kotod ../../src/koto-cli ../../src/koto-tx $ZIPDIR/KotoWallet.app/Contents/MacOS
cp ../../src/kotod ../../src/koto-cli ../../src/koto-tx $ZIPDIR/koto-bin
strip $ZIPDIR/KotoWallet.app/Contents/MacOS/kotod $ZIPDIR/KotoWallet.app/Contents/MacOS/koto-cli $ZIPDIR/KotoWallet.app/Contents/MacOS/koto-tx $ZIPDIR/koto-bin/kotod $ZIPDIR/koto-bin/koto-cli $ZIPDIR/koto-bin/koto-tx

zip -r ../${ZIPDIR}.zip $ZIPDIR
