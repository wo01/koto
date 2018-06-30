kotoのはじめかた

※Java SEが必要です。

"RUN-FIRST-ja." を右クリック→開くで開いて下さい。
（警告が出ますがそのまま開いて下さい）

その後、初回の起動に必要なkoto.confとzcashparams keyのダウンロードを自動で行い設定します。
設定完了後はkoto.confを自分の環境に合わせて設定してご使用下さい。

※zcashparamas内のsprout-proving.keyは約1GBあるため
ダウンロードに時間がかかります。しばらくお待ち下さい。

もしダウンロードがうまくいかない場合は
一度zcashparams内のsprout-proving.keyを削除して、もう一度 "RUN-FIRST-ja." を起動するか
https://mega.nz/#F!ByZkHTzb!gcerjOj02o8cCvmpsOp9BQ
からダウンロードのあと、フォルダに配置して下さい。


////kotoフォルダーの場所（デスクトップにはkotoフォルダーへのショートカットが作られます。）

/Library/Application Support/Koto/koto.conf
wallet.datやkoto.confがあります。
参考に初期設定がしてありますので自分好みに変更して下さい。

////zcashparamsフォルダーの場所

kotodを起動するのに必要なkeyファイルが入っています。
/Library/Application Support/ZcashParams


////使い方

//kotod
使い方はmacでも一緒ですのでこちらを参考にして下さい。
https://github.com/KotoDevelopers/koto/wiki/%E8%A7%A3%E8%AA%AC

./kotod を起動後
./koto-cli　を別窓で起動して操作します。

//kotowallet.app

GUI版のウォレットです。
RUN-FIRST-jaを最初に起動していただければ開くようになります。

//cpuminerでのマイニング

・ソロマイニングの場合
koto.confに書いた情報を使います。
例　./minerd -a yescrypt -o 127.0.0.1:8432 -u kotosan -p tekitou -t4

・プールに接続する場合
プールから提供されている情報を使います。
例　./minerd -a yescrypt -o stratum+tcp://URL:ポート番号 -u 受け取りアドレス -p tekitou -t2

-a アルゴリズム
-o 接続先URL
-u ユーザー名
-p パスワード
-t スレッド数
