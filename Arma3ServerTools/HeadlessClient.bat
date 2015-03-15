

@echo off
:: Modify your folders etc!
set serverpath="C:\Games\ArmA3\A3Master\"

echo.
echo Restarting The Server
:: start the Arma3 Dedicated server
cd /d %serverpath%

start "Arma3Server" arma3serverHC.exe -client -password=www123 -connect=127.0.0.1 -port=2302 -name=headlessclient

timeout 10

echo.
echo Server Started

timeout 30
 
cls
@exit