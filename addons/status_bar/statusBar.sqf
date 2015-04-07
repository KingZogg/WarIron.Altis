waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information

*/
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
systemChat format["[WarIron.Com] Read the briefing. Most common questions have answers there. teamspeak address is ts3.wariron.com", _rscLayer];

[] spawn {
	sleep 5;
	_counter = 360;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		_time = (round(1440-(serverTime)/60));  //edit the '240' (60*4=240) to change the countdown timer if your server restarts are shorter or longer than 4 hour intervals
		_hours = (floor(_time/60));
		_minutes = (_time - (_hours * 60));
		
		
		_decimalPlaces = 2;
        
		
		switch(_minutes) do
	{
		case 9: {_minutes = "09"};
		case 8: {_minutes = "08"};
		case 7: {_minutes = "07"};
		case 6: {_minutes = "06"};
		case 5: {_minutes = "05"};
		case 4: {_minutes = "04"};
		case 3: {_minutes = "03"};
		case 2: {_minutes = "02"};
		case 1: {_minutes = "01"};
		case 0: {_minutes = "00"};
	};
		
		//((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | PLAYERS: %2 | GRIDREF: %3 | RESTART IN: %4:%5", round diag_fps, count playableUnits, mapGridPosition player, _hours, _minutes, _counter,"%"];
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["WarIron.Com #1"];
	}; 
};


