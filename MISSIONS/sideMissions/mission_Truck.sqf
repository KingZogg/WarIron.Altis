// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_Truck.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "sideMissionDefines.sqf"

private ["_nbUnits", "_vehicleClass", "_vehicle", "_missionHintTime"];


_setupVars =
{
	_missionType = "Ammo Supply";
	_locationsArray = MissionSpawnMarkers;
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
	
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_vehicleClass =
	[
		//"B_Slingload_01_Ammo_F",
		"B_Truck_01_ammo_F",
		
//		"B_Slingload_01_Repair_F",
//		"B_Slingload_01_Fuel_F"
		"O_Truck_03_ammo_F",
//		"B_Truck_01_fuel_F",
//		"B_Truck_01_medical_F",
//		"B_Truck_01_Repair_F",
//		"O_Truck_03_fuel_F",
//		"O_Truck_03_medical_F",
//		"O_Truck_03_repair_F",
//		"I_Truck_02_covered_F",
//		"I_Truck_02_fuel_F",
//		"I_Truck_02_medical_F",
		"I_Truck_02_ammo_F"

	] call BIS_fnc_selectRandom;

	// Class, Position, Fuel, Ammo, Damage, Special
	_vehicle = [_vehicleClass, _missionPos] call createMissionVehicle;
	_vehicle call fn_refilltruck;

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");
  
	_missionHintTime = ["A3W_sideMissionTimeout", 120] call getPublicVar;
	_missionHintTime = _missionHintTime /60;
  
	_missionHintText = format ["A <t color='%2'>%1</t> has been located, go get it for your team.<br/>You have %3 Minutes<br/>To grab it.", _vehicleName, sideMissionColor, _missionHintTime];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _vehicle};

_failedExec =
{
	// Mission failed
	deleteVehicle _vehicle;
};

_successExec =
{
	// Mission completed
	_vehicle lock 1;
	_vehicle setVariable ["R3F_LOG_disabled", false, true];

	_successHintMessage = "The ammo has been captured, well done.";
};

_this call sideMissionProcessor;
