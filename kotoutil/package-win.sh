#!/bin/bash

sudo apt-get install default-jdk ant zip

VERSION=${VERSION:-`git describe --tags`}
ZIPDIR="Koto-${VERSION}-Windows"

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

cp ../win/* $ZIPDIR
cp koto-swing-wallet-ui/build/jars/KotoSwingWalletUI.jar $ZIPDIR
cp ../../src/kotod.exe ../../src/koto-cli.exe ../../src/koto-tx.exe $ZIPDIR

strip $ZIPDIR/kotod.exe $ZIPDIR/koto-cli.exe $ZIPDIR/koto-tx.exe

zip -r ../${ZIPDIR}.zip $ZIPDIR
