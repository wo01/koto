@echo off

SET kotodir=%appdata%\Koto
SET kotoconf=%kotodir%\koto.conf
SET sproutdir=%appdata%\ZcashParams
SET sprout-proving_url=http://dl.ko-to.org:8080/sprout-proving.key?a=.js
SET sprout-verifying_url=http://dl.ko-to.org:8080/sprout-verifying.key?a=.js
SET sprout-proving=%sproutdir%\sprout-proving.key
SET sprout-verifying=%sproutdir%\sprout-verifying.key
SET sprout-proving-hash=8bc20a7f013b2b58970cddd2e7ea028975c88ae7ceb9259a5344a16bc2c0eef7
SET sprout-verifying-hash=4bd498dae0aacfd8e98dc306338d017d9c08dd0918ead18172bd0aec2fc5df82


rem ###################################################
rem check existence of kotodir
if exist %kotodir% goto EXIST_KOTODIR
mkdir %kotodir%
:EXIST_KOTODIR


rem ###################################################
rem check existence of koto.conf
if exist %kotoconf% goto EXIST_KOTOCOIN
echo create koto.conf
echo rpcuser=%USERNAME%_%RANDOM% > %kotoconf%
echo rpcpassword=%USERNAME%_%RANDOM%_%RANDOM% >> %kotoconf%
:EXIST_KOTOCOIN


rem ###################################################
rem check existence of sproutdir
if exist %sproutdir% goto EXIST_SPROUTDIR
mkdir %sproutdir%
:EXIST_SPROUTDIR

rem ###################################################
rem check existence of sprout-proving
if exist %sprout-proving% goto EXIST_PROVING

:DOWNLOAD_PROVING
rem download if it does not exist
echo start downloading sprout-proving.key
bitsadmin.exe /TRANSFER DOWNLOAD_PROVING %sprout-proving_url% %sprout-proving%

:EXIST_PROVING
rem compare hash if it exsits
echo comparing hash of sprout-proving
@FOR /F "delims=/" %%i IN ('CERTUTIL -hashfile %sprout-proving% SHA256 ^| FIND /V ":"') DO @((SET hash_sha256=%%i))
set proving_sha256=%hash_sha256: =%

if not %proving_sha256%==%sprout-proving-hash% (
echo bad hash
del /Q %sprout-proving%
goto DOWNLOAD_PROVING
)
:END_PROVING


rem ###################################################
rem check existence of sprout-verifying
if exist %sprout-verifying% goto EXIST_VERIFYING

:DOWNLOAD_VERIFYING
rem download if it does not exist
echo start downloading sprout-verifying.key
bitsadmin.exe /TRANSFER DOWNLOAD_VERIFYING %sprout-verifying_url% %sprout-verifying%

:EXIST_VERIFYING
rem compare hash if it exsist
echo comparing hash of sprout-verifying
@FOR /F "delims=/" %%i IN ('CERTUTIL -hashfile %sprout-verifying% SHA256 ^| FIND /V ":"') DO @((SET hash_sha256=%%i))
set verifying_sha256=%hash_sha256: =%

if not %verifying_sha256%==%sprout-verifying-hash% (
echo bad hash
del /Q %sprout-verifying%
goto DOWNLOAD_VERIFYING
)
:END_VERIFYING


rem ###################################################
echo.
echo Initialization completed.
echo Your username and password for mining can be found in %kotoconf%.
echo.
@pause
