/////Kotoのはじめかた

※Windows 64-bitバージョンが必要です。
※GUI Walletを使用するにはJava 7 が必要です。

"RUN-FIRST_ja.bat" をダブルクリックして実行してください。
（警告が出る場合がありますがそのまま実行してください）

その後、起動に必要なkoto.confの生成とzcashparams keyのダウンロードを自動で行います。
※zcashparamas内のsprout-proving.keyは約1GBあるためダウンロードに時間がかかります。
しばらくお待ち下さい。

もしダウンロードがうまくいかない場合は、%appdata%\ZcashParams\sprout-proving.key を削除してから
もう一度 "RUN-FIRST-ja.bat" を実行するか、下記のURLから ZcashParams.zip をダウンロードし、
解凍ファイルを %appdata%\ZcashParams\ にコピーしてください。
https://mega.nz/#F!ByZkHTzb!gcerjOj02o8cCvmpsOp9BQ


////kotoフォルダーの場所
%appdata%\Koto\
koto.confやwallet.datがあります。
koto.confには最低限必要な設定がされています。環境に合わせて編集してください。
wallet.datはkotod.exeを起動後、自動的に生成されます。

////zcashparamsフォルダーの場所
%appdata%\ZcashParams\
sprout-proving.keyとsprout-verifying.keyがあります。
kotodを起動するために必要なファイルです。


////使い方

//kotod.exe
使い方はこちらを参考にして下さい。
https://github.com/KotoDevelopers/koto/wiki/%E8%A7%A3%E8%AA%AC

kotod.exe を起動後
koto-cli.exe　を別窓で起動して操作します。

//KotoSwingWalletUI.jar
GUI版のウォレットです。
ダブルクリックして開いてください。
