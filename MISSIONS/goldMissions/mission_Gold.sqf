// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_Gold.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 27/12/2014 08:00
//	@file Args:

if (!isServer) exitwith {};
#include "goldMissionDefines.sqf";

private ["_goldObjects", "_gold", "_goldPos", "_vehicleClass", "_vehicle", "_randomPos", "_depth", "_xpos", "_ypos", "_zpos", "_xdpos", "_ydpos", "_zdpos", "_minePos", "_mine", "_goldMinAmount", "_goldMaxAmount", "_goldAmount", "_goldPrice", "_diverDepth", "_diverMin", "_diverMax", "_missionHintTime" ];




_goldPrice = ["A3W_goldPrice", 25000] call getPublicVar;

_setupVars =
{
	_missionType = "Sub Down with Gold";
	_locationsArray = GoldMissionMarkers;
};

//generate a random number between -400 and +400 for vehicle position.
_xpos = ceil(random (700) - 350);
_ypos = ceil(random (700) - 350);
_zpos = 5;

//generate a random number between -400 and +400 for diver position.
_diverDepth = 0;
_diverDepthMin = 10;
_diverDepthMax = 30;
_diverDepth = _diverDepthMin + ceil(random _diverDepthMax);

_xdpos = ceil(random (700) - 300);
_ydpos = ceil(random (700) - 300);
_zdpos = _diverDepth;


_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	_vehicleClass = ["O_SDV_01_F", "O_SDV_01_F"] call BIS_fnc_selectRandom;
	
	_vehicle = [_vehicleClass, _missionPos,0,0,0.9] call createMissionVehicle;	
	_vehicle lockDriver true;
    
	_aiGroupPos = (getPos _vehicle vectorAdd [_xdpos,_ydpos,_zdpos]);
	_aiGroup = createGroup CIVILIAN;
		
	[_aiGroup, _aiGroupPos] call createLargeDivers;
	[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
	
	_vehicle setPosATL (getPosATL _vehicle vectorAdd [_xpos,_ypos,_zpos]);
	

_depth = 2; // you must put a positive number in here

for "_count" from 1 to 100 do {
    
	_minePos = [ (_missionPos select 0) + ((random 800) - 400),(_missionPos select 1) + ((random 800) - 400), -1 * (random _depth) ];
    
	if (surfaceIsWater _minePos) then { 
	
	_mine = createmine [ "UnderwaterMine", _minePos,[], 0 ];  
	
								   };
}; 
	_missionHintTime = ["A3W_goldMissionTimeout", 120] call getPublicVar;
	_missionHintTime = _missionHintTime / 60;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_missionHintText = format ["A Sub has run into a minefield.<br/>It is damaged and has run out of fuel.<br/>It is carrying,<br/><t color='%1'>Up to $1M in Gold Bullion!</t><br/>Divers are on guard and are waiting for fuel and repairs.<br/>You have %2 Minutes<br/>To complete this mission", goldMissionColor, _missionHintTime];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	deleteVehicle _vehicle;
	
	{
	if (_x isKindOf "TimeBombCore") then {deleteVehicle _x};
	} forEach nearestObjects [_missionPos,[],600];
	
	
};

// _vehicle is automatically deleted or unlocked in missionProcessor depending on the outcome


// Mission complete
_successExec =
{	_vehicle lockDriver false;
	
	{
		if (_x isKindOf "TimeBombCore") then {deleteVehicle _x};
		} forEach nearestObjects [_missionPos,[],600];	
	
	sleep 5;
	
	
	_goldMinAmount = (500000 /_goldPrice);
	_goldMaxAmount = ((1000000 /_goldPrice) - (_goldMinAmount - 1));
	_goldAmount = _goldMinAmount + ceil(random _goldMaxAmount);

	
	for "_i" from 1 to _goldAmount do{
		
		_gold = createVehicle ["Land_TinContainer_F", _missionPos, [], 0, "None"];
		_gold setPosATL (getPosATL _vehicle vectorAdd [(ceil(random (16) - 8)),(ceil(random (16) - 8)),1]);
		};

	_goldAmount = _goldAmount * _goldPrice;	
	
	diag_log format ["#################### GOLD Amount = %1, Mission Type %2", _goldAmount, _missionType];
		
	_successHintMessage = format ["The Divers Are Dead. There is <t color='%2'>      $%1 </t>on the bottom.<br/> Now find the Sub! And the GOLD" ,_goldAmount, goldMissionColor];

	
};

_this call goldMissionProcessor;
