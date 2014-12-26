@echo off
:: Modify your folders etc!
set serverpath="C:\Games\ArmA3\A3Master\"



set arma3servertools="C:\Arma3Servertools\"

set BERConPath="C:\Games\ArmA3\A3Master\battleye"
set becpath="C:\Arma3Servertools\BEC\"
set ArmaServerMonitorPath="C:\Games\ArmA3\A3Master\"

set serverexe=arma3server.exe
set ArmaServerMonitorbat=ArmaServerMonitor.bat
set ArmaServermonitorexe=ArmaServermonitor.exe

echo.
echo KILL server
cd /d %serverpath%
taskkill /im %serverexe%
timeout 2

echo.
echo Kill Bec.exe
cd /d %becpath%
taskkill /im bec.exe
timeout 2

echo
echo Kill BERCon.exe
cd /d %BERConPath%
taskkill /f /im bercon.exe
timeout 2

echo
echo Kill ArmaServerMonitor.exe
cd /d %ArmaServerMonitorPath%
taskkill /f /im ArmaServerMonitor.exe
timeout 2


echo.
echo Restarting The Server
:: start the Arma3 Dedicated server
cd /d %serverpath%

:: -mod= is used if you also have a steam copy installed to that the dedicated server does not load mods from there.
start "Arma3Server" arma3server.exe -port=2302 -config=CONFIG_Vanilla.cfg -world=empty -maxMem=8192 -enableHT -mod= -cfg=Arma3.cfg -profiles=c:\Games\Arma3\A3Master -BEpath=c:\Games\ArmA3\A3Master\battleye  -loadMissionToMemory

::start "Arma3Server" arma3server.exe -port=2302 -config=CONFIG_Vanilla.cfg -world=empty -maxMem=8192 -enableHT -mod= -cfg=Arma3.cfg -profiles=c:\Games\Arma3\A3Master

timeout 10


echo.
echo Starting Arma Server Monitor (ASM)
cd /d %arma3servertools%
start "ArmaServerMonitorbat" ArmaServerMonitor.bat

echo.
echo Starting BERCon.bat
:: start Battleye Rcon
cd /d %BERConPath%
start "BERcon" BERCon.bat

echo.
echo Starting Battleye Extended Controls
cd /d %becpath%
start "Bec" Bec.exe -f Config.cfg --dec

echo.
echo Server Started

timeout 30
 
cls
@exit