/////How to Start Koto

* Windows 64-bit version is required.
* Java 7 or later is required for GUI wallet.

Firstly, double click "RUN-FIRST_en.bat" and open it.
（Warning message may appear but you can ignore and open it.）

The required files, koto.conf is generated and zcashparams key files are downloaded automatically.
* It could take some time for downloading since sprout-proving.key in zcashparamas is close to 1 GB in size.

If downloading is unsuccessful, you should delete %appdata%\ZcashParams\sprout-proving.key and open "RUN-FIRST_en.bat" again.
Or you can download the ZcashParams.zip file directly from the following URL and copy the unzipped files into %appdata%\ZcashParams\ folder.
https://mega.nz/#F!ByZkHTzb!gcerjOj02o8cCvmpsOp9BQ


////location of Koto folder
%appdata%\Koto\
koto.conf and wallet.dat are in this folder.
You can edit koto.conf according to your environment.
wallet.dat will be generated automatically by kotod.exe.

////location of zcashparams folder
%appdata%\ZcashParams\
sprout-proving.key and sprout-verifying.key are in this folder.


////How to run Koto

//kotod.exe
This is CUI wallet.
Run kotod.exe in command prompt and koto-cli.exe in yet another command prompt.
For details, you can refer to the command line help by run kotod.exe -help or koto-cli.exe -help.

//KotoSwingWalletUI.jar
This is GUI frontend for the CUI wallet.
You can double click and open it.
