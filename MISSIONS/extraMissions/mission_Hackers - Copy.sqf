// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HackLaptop.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "extraMissionDefines.sqf";

#define I(X) X = X + 1;

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

_setupObjects =
{

//delete existing base parts and vehicles at location
	_baseToDelete = nearestObjects [_missionPos, ["All"], 25];
	{ deleteVehicle _x } forEach _baseToDelete; 

_buildingTypes = [
	"Land_Chapel_V1_F",
	"Land_Chapel_V2_F",
	"Land_Chapel_Small_V1_F",
	"Land_Chapel_Small_V2_F",
	"Land_Offices_01_V1_F",
	"Land_Church_01_V1_F",
	"Land_Hospital_side1_F",
	"Land_Hospital_side2_F",
	"Land_WIP_F",
//	"Land_u_Addon_02_V1_F",
//	"Land_i_Addon_02_V1_F",
//	"Land_i_Addon_03_V1_F",
//	"Land_i_Addon_03mid_V1_F",
//	"Land_i_Addon_04_V1_F",
	"Land_i_Garage_V1_F",
	"Land_i_Garage_V2_F",
	"Land_i_Garage_V2_dam_F",
	"Land_i_House_Big_01_V1_F",
	"Land_i_House_Big_01_V2_F",
	"Land_u_House_Big_01_V1_F",
	"Land_i_House_Big_02_V2_F",
	"Land_u_House_Big_02_V1_F",
	"Land_i_Shop_02_V1_F",
	"Land_i_Shop_02_V2_F",
	"Land_i_Shop_02_V3_F",
	"Land_u_Shop_02_V1_F",
	"Land_i_House_Small_01_V1_F",
	"Land_i_House_Small_01_V2_F",
	"Land_i_House_Small_01_V3_F",
	"Land_u_House_Small_01_V1_F",
	"Land_i_House_Small_02_V1_F",
	"Land_i_House_Small_02_V2_F",
	"Land_i_House_Small_02_V3_F",
	"Land_u_House_Small_02_V1_F",
	"Land_i_House_Small_03_V1_F",
	"Land_Slum_House01_F",
	"Land_Slum_House02_F",
	"Land_Slum_House03_F",
	"Land_i_Stone_HouseBig_V1_F",
	"Land_i_Stone_HouseBig_V2_F",
	"Land_i_Stone_HouseBig_V3_F",
	"Land_i_Stone_Shed_V1_F",
	"Land_i_Stone_Shed_V2_F",
	"Land_i_Stone_Shed_V3_F",
	"Land_i_Stone_HouseSmall_V1_F",
	"Land_i_Stone_HouseSmall_V2_F",
	"Land_i_Stone_HouseSmall_V3_F",
	"Land_Unfinished_Building_01_F",
	"Land_Unfinished_Building_02_F",
	"Land_CarService_F"
];


//"Land_Kiosk_blueking_F"
//"Land_Kiosk_gyros_F"
//"Land_Kiosk_papers_F"
//"Land_Kiosk_redburger_F"
	
// find available buildings
_buildingsArray = nearestObjects [_missionPos, _buildingTypes, _buildingRadius];

_posSelectedBuilding = 0;
_selectedBuilding = objNull;
_maxNumberOfPositions = objNull;


//using the while here to stop the occasional bottom left corner position error.
//if it's less than 1000 its off the island so find another one.
while {_posSelectedBuilding < 1000} do {
	
	_selectedBuilding = _buildingsArray call BIS_fnc_selectRandom;	
	_posSelectedBuilding = getPosASL _selectedBuilding;
	_posSelectedBuilding = _posSelectedBuilding select 0;

	_maxNumberOfPositions = _selectedBuilding;
	_maxNumberOfPositions = _buildingsArray call BIS_fnc_buildingPositions;
			
};

diag_log format ["#################### _posSelectedBuilding in _posSelectedBuilding = %1", _posSelectedBuilding];
diag_log format ["#################### _selectedBuilding in _selectedBuilding = %1", _selectedBuilding];
diag_log format ["#################### _maxNumberOfPositions in _maxNumberOfPositions = %1", _maxNumberOfPositions];


	
// find how many positions are available in the building	
   _cnt = 0;
   //_posarray = [];
   //as long as building position _cnt not equal to "[0,0,0]" keep looping
   
   while {format ["%1", _selectedBuilding buildingpos _cnt] != "[0,0,0]" } do {
    
	//   _pos = _selectedBuilding buildingpos _cnt;        //select building position _cnt
    //   _posarray = _posarray + [_pos];        //add the position to the list
        _cnt = _cnt + 1;        //increment counter
        sleep 0.01;
    }; 	
	
 _selectedBuildingPos = ceil(random _cnt); //select a random position
 
 if _selectedBuildingPos == 0 then 
 
	{
		_selectedBuildingPos = 0;
	}
	else
	{
		_selectedBuildingPos = _selectedBuildingPos - 1;
	};
	
 
diag_log format ["#################### _selectedBuildingPos in _selectedBuildingPos = %1", _selectedBuildingPos];	

	
	_table = createVehicle ["Land_WoodenTable_small_F", _selectedBuilding, [], 0, "CAN COLLIDE"];
   
   _table setDir (getDir _selectedBuilding);

   _table setPosATL (_selectedBuilding buildingPos _selectedBuildingPos);
	
	_laptopPos = getPosASL _table;
	
	_laptop = createVehicle ["Land_Laptop_unfolded_F", _laptopPos, [], 0, "CAN COLLIDE"];
	_laptop attachTo [_table,[0,0,0.60]];


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