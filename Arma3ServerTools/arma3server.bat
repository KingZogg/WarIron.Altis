
@echo
::start "serverbat" C:\Games\Arma3\A3Master\arma3server.exe "-profiles=c:\Games\Arma3\A3Master" -name=Administrator -port=2302 -config=CONFIG_Vanilla.cfg -cfg=arma3.cfg -world=empty
start "serverbat" C:\Games\Arma3\A3Master\arma3server.exe
timeout 5
cls
exit