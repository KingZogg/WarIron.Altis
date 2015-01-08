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

private ["_goldObjects", "_gold", "_goldPos", "_vehicleClass", "_vehicle"];

_setupVars =
{
	_missionType = "One Million Dollars in Gold Bullion";
	_locationsArray = GoldMissionMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	_goldObjects = [];

	for "_i" from 1 to 10 do
	{
		_gold = createVehicle ["Land_TinContainer_F", _missionPos, [], 0, "None"];
		_gold setVariable ["owner", "mission", true];
	
	
	// Money value is set only when AI are dead
		_goldObjects pushBack _gold;
	};
	
	_vehicleClass = ["O_SDV_01_F", "O_SDV_01_F"] call BIS_fnc_selectRandom;
		
		
	_vehicle = [_vehicleClass, _missionPos,0,0,0.9] call createMissionVehicle;
	_vehicle lockDriver true;
    		
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos] call createLargeDivers;
	[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
	
	// Randomize the location of the sub and divers
	//_vehicle setPos (getPos _vehicle vectorAdd [200,200,10]);
	//_aiGroup setPos (getPos _aiGroup vectorAdd [200,200,2]);
	
	
	
	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_missionHintText = format ["A Sub has been damaged by a mine. It has run out of fuel and is carrying<t color='%1'> $1,000,000 in Gold Bullion!</t> Divers are on guard and are waiting for fuel and repairs.<br/>If you want the gold, you will need diving gear and have an underwater weapon.", goldMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach _goldObjects;
};

// _vehicle is automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission complete
	_vehicle lockDriver false;

	// Give the rewards
	{
		_x setVariable ["cmoney", 100000, true];
		_x setVariable ["owner", "world", true];
	} forEach _goldObjects;

	_successHintMessage = "The divers have been killed. Collect the Gold!";
};

_this call goldMissionProcessor;
