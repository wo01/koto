#!/bin/sh

clear

# kotoフォルダ作成 ----------------------
echo Initial installation will start
sleep 1

echo
echo ////  Create koto.conf to /Application/Support/koto
# フォルダがない場合のみつくる
mkdir -p ~/Library/Application\ Support/koto

if [ -e ~/Library/Application\ Support/koto/koto.conf ]; then
    echo
    echo koto.conf already exists
else 
    
    echo "rpcuser=koto         #Username for JSON-RPC connections" >>~/Library/Application\ Support/koto/koto.conf
    echo "rpcpassword=tekitou     #Password for JSON-RPC connections　" >>~/Library/Application\ Support/koto/koto.conf
    echo "rpcallowip=127.0.0.1    #Allow JSON-RPC connections from specified source" >>~/Library/Application\ Support/koto/koto.conf
    echo "rpcport=8432            #Listen for JSON-RPC connections on <port> (default: 8432 or testnet:18432)" >>~/Library/Application\ Support/koto/koto.conf
    echo "addnode=160.16.79.210   #Add a node to connect to and attempt to keep the connection open" >>~/Library/Application\ Support/koto/koto.conf
    echo "showmetrics=1           #Show metrics on stdout (default: 1 if running in a console, 0 otherwise)" >>~/Library/Application\ Support/koto/koto.conf
    echo "gen=0                   #Generate coins (default: 0)" >>~/Library/Application\ Support/koto/koto.conf
    echo "genproclimit=4          #Set the number of threads for coin generation if enabled (-1 = allcores, default: 1)" >>~/Library/Application\ Support/koto/koto.conf
fi

# Zcashparamsフォルダ作成 -----------------------
echo
echo ////  Donwload key to /ApplicationSupport/ZcashParams/
# Keyがない場合はダウンロードする
mkdir -p ~/Library/Application\ Support/ZcashParams
cd ~/Library/Application\ Support/ZcashParams

if [ -e ~/Library/Application\ Support/ZcashParams/sprout-verifying.key ]; then
    echo
    echo sprout-verifying already exists
else 
    echo
    echo download sprout-verifying.key
  curl -O -# http://d.koto.cash/sprout-verifying.key
fi

if [ -e ~/Library/Application\ Support/ZcashParams/sprout-proving.key ]; then
    echo
    echo sprout-proving.keya lready exists
else 
    echo
    echo download sprout-proving.key
  curl -O -# http://d.koto.cash/sprout-proving.key
fi

# /kotoフォルダを開く -----------------------
echo 
echo 
echo Preparation is completed.
echo Please change the setting to your preference and use.
echo
echo
#if [ -e ~/Library/Application\ Support/koto -a -e ~/Desktop/kotoへのショートカット ]; then
#    echo
#else
#    ln -s ~/Library/Application\ Support/koto ~/Desktop/kotoへのショートカット
#    osascript -e 'display notification "デスクトップにショートカットを作成しました" with title "koto"'
#fi
#cd ~/Library/Application\ Support/koto
#open ~/Library/Application\ Support/koto/fin.txt
