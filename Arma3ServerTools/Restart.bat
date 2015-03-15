@echo off
:: Modify your folders etc!
:: Server
set serverpath="C:\Games\ArmA3\A3Master\"
set serverexe=arma3server.exe

:: Set Paths to files.
set arma3servertools="C:\Arma3Servertools\"
set BERConPath="C:\Games\ArmA3\A3Master\battleye"
set becpath="C:\Arma3Servertools\BEC\"
set ArmaServerMonitorPath="C:\Games\ArmA3\A3Master\"

:: Set name to refer to file.
::set ArmaServerMonitorbat=ArmaServerMonitor.bat
::set ArmaServermonitorexe=ArmaServermonitor.exe
::set Updater=updater.cmd


echo.
echo KILL server
cd /d %serverpath%
taskkill /im %serverexe%
::timeout 2

echo.
echo Kill Bec.exe
cd /d %becpath%
taskkill /im bec.exe
::timeout 2

echo
echo Kill BERCon.exe
cd /d %BERConPath%
taskkill /f /im bercon.exe
::timeout 2

echo
echo Kill ArmaServerMonitor.exe
cd /d %ArmaServerMonitorPath%
taskkill /f /im ArmaServerMonitor.exe
::timeout 2


::RESTART

::Check for new Arma3 Update
echo.
echo Checking for new Arma3 Update.
Start "Updater" /wait C:\Arma3Servertools\updater.cmd


echo.
echo Restarting The Server
:: start the Arma3 Dedicated server
cd /d %serverpath%

:: ONLY USED IF MISSIONS ARE NOT MOVED FROM THE NORMAL MISSIONS FOLDER !
:: -mod= is used if you also have a steam copy installed to that the dedicated server does not load mods from there.
::start "Arma3Server" arma3server.exe -port=2302 -config=CONFIG_Vanilla.cfg -world=empty -maxMem=8192 -enableHT -mod= -cfg=Arma3.cfg -profiles=c:\Games\Arma3\A3Master -BEpath=c:\Games\ArmA3\A3Master\battleye  -loadMissionToMemory

:: SERVER MISSIONS MOVED SERVER SIDE.
start "Arma3Server" arma3server.exe -port=2302 -config=CONFIG_Vanilla.cfg -world=empty -maxMem=8192 -enableHT -mod=SERVER -cfg=Arma3.cfg -profiles=c:\Games\Arma3\A3Master -BEpath=c:\Games\ArmA3\A3Master\battleye  -loadMissionToMemory

::timeout 5

Start "" C:\Games\Arma3\A3Master\ArmaServerMonitor.exe -w1500 -lfilenameprefix
echo.
echo ASM Started
::timeout 5

echo.
echo Starting BERCon.bat
:: start Battleye Rcon
cd /d %BERConPath%
start "BERcon" BERCon.bat

::timeout 5

echo.
echo Starting Battleye Extended Controls
cd /d %becpath%
start "Bec" Bec.exe -f Config.cfg --dec

echo.
echo Server Started

::timeout 5
 
cls
@exit