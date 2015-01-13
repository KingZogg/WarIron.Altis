// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_HeliGold.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy ,KingZog [git]
//	@file Created: 27/12/2014 08:00
//	@file Args:

if (!isServer) exitwith {};
#include "goldMissionDefines.sqf";

private ["_goldObjects", "_gold", "_goldPos", "_vehicleClass", "_vehicle", "_randomPos", "_depth", "_xpos", "_ypos", "_zpos", "_minePos", "_mine" ];

_setupVars =
{
	_missionType = "One Million Dollars in Gold Bullion";
	_locationsArray = GoldMissionMarkers;
};

//generate a random number between -400 and +400
_xpos = ceil(random (700) - 350);
_ypos = ceil(random (700) - 350);
_zpos = 5;


_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	_vehicleClass = ["O_SDV_01_F", "O_SDV_01_F"] call BIS_fnc_selectRandom;
	
	_vehicle = [_vehicleClass, _missionPos,0,0,0.9] call createMissionVehicle;	
	_vehicle lockDriver true;
    
	_aiGroupPos = (getPos _vehicle vectorAdd [_xpos,_ypos,0]);
	_aiGroup = createGroup CIVILIAN;
		
	[_aiGroup, _aiGroupPos] call createLargeDivers;
	[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
	
	
	
	_vehicle setPosATL (getPosATL _vehicle vectorAdd [_xpos,_ypos,_zpos]);
	

_depth = 2; // you must put a positive number in here

for "_count" from 1 to 100 do {
    
	_minePos = [ (_missionPos select 0) + ((random 800) - 400),(_missionPos select 1) + ((random 800) - 400), -1 * (random _depth) ];
    
	if (surfaceIsWater _minePos) then { 
	
	_mine = createMine [ "UnderwaterMine", _minePos,[], 0 ];  
	
								   };
}; 


	
	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_missionHintText = format ["A Sub has run into a minefield. It is damaged and has run out of fuel. It is carrying<t color='%1'> $1,000,000 in Gold Bullion!</t> Divers are on guard and are waiting for fuel and repairs.<br/>Kill the guards and find the sub.", goldMissionColor];
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
	} forEach nearestObjects [_missionPos,[],500];
	
	
};

// _vehicle is automatically deleted or unlocked in missionProcessor depending on the outcome


// Mission complete
_successExec =
{	_vehicle lockDriver false;
	
	{
		if (_x isKindOf "TimeBombCore") then {deleteVehicle _x};
		} forEach nearestObjects [_missionPos,[],600];	
	
	
	for "_i" from 1 to 10 do{
		_gold = createVehicle ["Land_TinContainer_F", _missionPos, [], 0, "None"];
		_gold setPos (getPos _gold vectorAdd [(_xpos + ceil(random (10) - 5)),(_ypos + ceil(random (10) - 5)),5]);
		};

		
		
		_successHintMessage = "The divers have all been killed. Collect the Gold!";
};

_this call goldMissionProcessor;
