// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HackLaptop.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "extraMissionDefines.sqf";

private ["_positions", "_bunker", "_laptop", "_obj", "_randomGroup", "_vehicleName","_table", "_buildingRadius", "_townName"];


_setupVars =
{
	_missionType = "Find the Laptop";
	//_locationsArray = MissionSpawnMarkers;

// settings for this mission
	_locArray = ((call cityList2) call BIS_fnc_selectRandom);
	_missionPos = markerPos (_locArray select 0);
	_buildingRadius = _locArray select 1;
	_buildingRadius = _buildingRadius - 5;
	_townName = _locArray select 2;
			
};


scopeName "main";

_setupObjects =
{

// find available buildings

_buildingsArray = nearestObjects [_missionPos, ["house"], _buildingRadius];


_result = 0;
_checkPos = objNull;
_selectedBuilding = objNull;
_buildingPositions = objNull;
_selectedBuildingPos = objNull;

  
//make sure there are some available building positions.
while {_result <= 0} do {
	
	_selectedBuilding = _buildingsArray call BIS_fnc_selectRandom;	
		
	_buildingPositions = _selectedBuilding call BIS_fnc_buildingPositions;
	
	_selectedBuildingPos = _buildingPositions call BIS_fnc_selectRandom;
	_result = count _buildingPositions;		
};

//diag_log format ["#################### _selectedBuilding in _selectedBuilding = %1", _selectedBuilding];
//diag_log format ["#################### _buildingPositions in _buildingPositions = %1", _buildingPositions];
//diag_log format ["#################### _result in _result = %1", _result];	

_selectedBuildingPos = ceil(random _result); //select a random position 
//diag_log format ["#################### _selectedBuildingPos in _selectedBuildingPos = %1", _selectedBuildingPos];	
//diag_log format ["#################### _result in _result = %1", _result];	
	
	sleep 0.5;
	
	_table = createVehicle ["Land_WoodenTable_small_F", _selectedBuilding, [], 0, "CAN COLLIDE"];
   
   _table setDir (getDir _selectedBuilding);

   _table setPosATL (_selectedBuilding buildingPos _selectedBuildingPos);
	
	_laptopPos = getPosASL _table;
	
	_laptop = createVehicle ["Land_Laptop_unfolded_F", _laptopPos, [], 0, "CAN COLLIDE"];
	_laptop attachTo [_table,[0,0,0.60]];

	
	_checkPos = getPosASL _table;
	_checkPos = _checkPos select 0;
	
diag_log format ["#################### _checkPos in _checkPos = %1", _checkPos];

if (_checkPos <= 1000) then {
					{ deleteVehicle _x } forEach [_laptop, _table];
						breakto "main"
							};

	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";

	_laptop setVariable [ "Done", false, true ];
	
	_vehicleName = "Laptop";
	
	_missionHintTime = ["A3W_extraMissionTimeout", 120] call getPublicVar;
	_missionHintTime = _missionHintTime /60;
	
	_missionHintText = format ["Hackers have lost a <t color='%2'>laptop</t> in the highlighted search area.<br/>it is very valuable!.<br/ Nobody knows exactly what is on it.<br/>Retrieve it before someone else does.<br/>You have %3 Minutes<br/>To find it", _vehicleName, extraMissionColor, _missionHintTime];
};

_waitUntilMarkerPos = nil;
_waitUntilExec =
{
	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";
};
_waitUntilCondition = nil;
_waitUntilSuccessCondition = { _laptop getVariable ["Done", false] };
_ignoreAiDeaths = true;

_failedExec =
{
	// Mission failed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_laptop, _table];
	
	
};

_successExec =
{
	// Mission completed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_laptop,_table ];

	_successHintMessage = format ["The laptop is hacked. Well done!"];
};

_this call extraMissionProcessor;