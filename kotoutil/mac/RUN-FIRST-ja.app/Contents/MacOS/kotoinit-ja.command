#!/bin/sh

clear

# kotoフォルダ作成 ----------------------
echo koto初回インストール開始します。
sleep 1

echo
echo ////   Application/Support/koto/にkotoフォルダにkoto.confを作成します。
# フォルダがない場合のみつくる
mkdir -p ~/Library/Application\ Support/koto

if [ -e ~/Library/Application\ Support/koto/koto.conf ]; then
    echo
    echo koto.confがすでに存在します。
else 
    
    echo "rpcuser=kotosan         #ユーザ名" >>~/Library/Application\ Support/koto/koto.conf
    echo "rpcpassword=tekitou     #ユーザーパス なんでも良い" >>~/Library/Application\ Support/koto/koto.conf
    echo "rpcallowip=127.0.0.1    #接続を許可するアドレス" >>~/Library/Application\ Support/koto/koto.conf
    echo "rpcport=8432            #ポート番号" >>~/Library/Application\ Support/koto/koto.conf
    echo "addnode=160.16.79.210   #ピアネットワークのノードを追加" >>~/Library/Application\ Support/koto/koto.conf
    echo "showmetrics=1           #kotodを表示するか　0=非表示　1=表示" >>~/Library/Application\ Support/koto/koto.conf
    echo "gen=0                   #kotod立ち上げ時マイニングを始めるか　gen=0 マイニングなし　gen1=マイニングする" >>~/Library/Application\ Support/koto/koto.conf
    echo "genproclimit=4          #使用スレッド数の指定" >>~/Library/Application\ Support/koto/koto.conf
fi

# Zcashparamsフォルダ作成 -----------------------
echo
echo ////   ApplicationSupport/ZcashParams/にkeyをダウンロードします。
# Keyがない場合はダウンロードする
mkdir -p ~/Library/Application\ Support/ZcashParams
cd ~/Library/Application\ Support/ZcashParams

if [ -e ~/Library/Application\ Support/ZcashParams/sprout-verifying.key ]; then
    echo
    echo sprout-verifying.keyがすでに存在します。
else 
    echo
    echo download sprout-verifying.key
  curl -O -# http://d.koto.cash/sprout-verifying.key
fi

if [ -e ~/Library/Application\ Support/ZcashParams/sprout-proving.key ]; then
    echo
    echo sprout-proving.keyがすでに存在します。
else 
    echo
    echo download sprout-proving.key
  curl -O -# http://d.koto.cash/sprout-proving.key
fi

# /kotoフォルダを開く -----------------------
echo 
echo 
echo 準備が完了しました。
echo 設定を自分好みに変更してご使用下さい。
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