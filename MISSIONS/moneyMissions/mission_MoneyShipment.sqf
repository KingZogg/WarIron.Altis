// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 2.1
//	@file Name: mission_MoneyShipment.sqf
//	@file Author: JoSchaap / routes by Del1te - (original idea by Sanjo), AgentRev
//	@file Created: 31/08/2013 18:19

if (!isServer) exitwith {};
#include "moneyMissionDefines.sqf";

private ["_MoneyShipment", "_moneyAmount", "_convoys", "_vehChoices", "_moneyText", "_vehClasses", "_createVehicle", "_vehicles", "_veh2", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_cash", "_goldAmount", "_goldMinAmount", "_goldMaxAmount", "_missionHintTime"];

_goldPrice = ["A3W_goldPrice", 25000] call getPublicVar;


_setupVars =
{
	_locationsArray = LandConvoyPaths;
	
		_search = false;
        _buildingRadius = 0;

	_MoneyShipment =
	[
		// Easy
		[
			"Small Money/Gold Shipment", // Marker text
			20000, // Money
			[
				[ // NATO convoy
					["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"], // Veh 1
					["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"] // Veh 2
				],
				[ // CSAT convoy
					["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"], // Veh 1
					["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"] // Veh 2
				],
				[ // AAF convoy
					["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"], // Veh 1
					["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"] // Veh 2
				]
			]
		],
		// Medium
		[
			"Medium Money/Gold Shipment", // Marker text
			40000, // Money
			[
				[ // NATO convoy
					["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"], // Veh 1
					["B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F"], // Veh 2
					["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"] // Veh 3
				],
				[ // CSAT convoy
					["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"], // Veh 1
					["O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F"], // Veh 2
					["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"] // Veh 3
				],
				[ // AAF convoy
					["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"], // Veh 1
					["I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F"], // Veh 2
					["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"] // Veh 3
				]
			]
		],
		// Hard
		[
			"Large Money/Gold Shipment", // Marker text
			60000, // Money
			[
				[ // NATO convoy
					["B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F"], // Veh 1
					["B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"], // Veh 2
					["B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F"] // Veh 3
				],
				[ // CSAT convoy
					["O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F"], // Veh 1
					["O_MBT_02_cannon_F"], // Veh 2
					["O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F"] // Veh 3
				],
				[ // AAF convoy
					["I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F"], // Veh 1
					["I_MBT_03_cannon_F"], // Veh 2
					["I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F"] // Veh 3
				]
			]
		],
		// Extreme
		[
			"Heavy Money/Gold Shipment", // Marker text
			80000, // Money
			[
				[ // NATO convoy
					["B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"], // Veh 1
					["B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"], // Veh 2
					["B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"], // Veh 3
					["B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"] // Veh 4
				],
				[ // CSAT convoy
					["O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F", "O_MBT_02_cannon_F"], // Veh 1
					["O_APC_Tracked_02_AA_F", "O_MBT_02_cannon_F"], // Veh 2
					["O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F", "O_MBT_02_cannon_F"], // Veh 3
					["O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F", "O_MBT_02_cannon_F"] // Veh 4
				],
				[ // AAF convoy
					["I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F", "I_MBT_03_cannon_F"], // Veh 1
					["I_APC_tracked_03_cannon_F", "I_MBT_03_cannon_F"], // Veh 2
					["I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F", "I_MBT_03_cannon_F"], // Veh 3
					["I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F", "I_MBT_03_cannon_F"] // Veh 4
				]
			]
		]
	]
	call BIS_fnc_selectRandom;

	_missionType = _MoneyShipment select 0;
	_moneyAmount = _MoneyShipment select 1;
	_convoys = _MoneyShipment select 2;
	
	_vehChoices = _convoys call BIS_fnc_selectRandom;
		
	_moneyText = format ["$%1", [_moneyAmount] call fn_numbersText];

	_vehClasses = [];
	{ _vehClasses pushBack (_x call BIS_fnc_selectRandom) } forEach _vehChoices;

	
	
	
	_goldAmount = 0;
	
		switch (_missionType) do
	{
    case "Small Money/Gold Shipment":
		{
			//20k Money +
			_goldMinAmount = 0;
			_goldMaxAmount = 1;
			_goldAmount = _goldMinAmount + ceil(random _goldMaxAmount);
		};
	
	case "Medium Money/Gold Shipment":
		{
			
			//40k Money +
			
			_goldMinAmount = 1;
			_goldMaxAmount = 2;
			_goldAmount = _goldMinAmount + ceil(random _goldMaxAmount);
		};	
	
	case "Large Money/Gold Shipment":
		{
			//80k Money +
			_goldMinAmount = 2;
			_goldMaxAmount = 2;
			_goldAmount = _goldMinAmount + ceil(random _goldMaxAmount);
		};
	
	case "Heavy Money/Gold Shipment":
		{
			//100k Money +
			_goldMinAmount = 2;
			_goldMaxAmount = 4;
			_goldAmount = _goldMinAmount + ceil(random _goldMaxAmount);
		};
	};





};







_setupObjects =
{
	private ["_starts", "_startDirs", "_waypoints"];
	call compile preprocessFileLineNumbers format ["\server\scripts\convoys\%1.sqf", _missionLocation];

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "None"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInDriver _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInCargo [_vehicle, 0];

		if !(_type isKindOf "Truck_F") then
		{
			_soldier = [_aiGroup, _position] call createRandomSoldier;
			_soldier moveInGunner _vehicle;

			_soldier = [_aiGroup, _position] call createRandomSoldier;

			if (_vehicle emptyPositions "commander" > 0) then
			{
				_soldier moveInCommander _vehicle;
			}
			else
			{
				_soldier moveInCargo [_vehicle, 1];
			};
		};

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;

		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicles = [];
	{
		_vehicles pushBack ([_x, _starts select 0, _startdirs select 0, _aiGroup] call _createVehicle);
	} forEach _vehClasses;

	_veh2 = _vehClasses select (1 min (count _vehClasses - 1));

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "GREEN"; // units will defend themselves
	_aiGroup setBehaviour "SAFE"; // units feel safe until they spot an enemy or get into contact
	_aiGroup setFormation "STAG COLUMN";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	{
		_waypoint = _aiGroup addWaypoint [_x, 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 25;
		_waypoint setWaypointCombatMode "GREEN";
		_waypoint setWaypointBehaviour "SAFE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach _waypoints;

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh2 >> "picture");
	_vehicleName = getText (configFile >> "cfgVehicles" >> _veh2 >> "displayName");
    
	_missionHintTime = ["A3W_mainMissionTimeout", 120] call getPublicVar;
	_missionHintTime = _missionHintTime /60;
	diag_log format ["#################### Mission Type = %1, Mission Timeout = %2", _missionType, _missionHintTime];	
	
	_missionHintText = format ["A convoy transporting <t color='%1'>%2</t><br/> and an unknown amount of GOLD <br/> escorted by a <t color='%1'>%3</t> is en route to an unknown location.<br/>Stop them!<br/>You have %4 Minutes<br/>To ambush and rob them.", moneyMissionColor, _moneyText, _vehicleName, _missionHintTime];

	_numWaypoints = count waypoints _aiGroup;
	
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed

	for "_i" from 1 to 10 do
	{
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _moneyAmount / 10, true];
		_cash setVariable ["owner", "world", true];
	};
	
	for "_i" from 1 to _goldAmount do
	{
		_gold = createVehicle ["Land_TinContainer_F", _lastPos, [], 5, "None"];
		_gold setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
	};


	
	_goldAmount = _goldAmount * _goldPrice;
	
	
	diag_log format ["#################### GOLD Amount = %1, Mission Type %2", _goldAmount, _missionType];

	_successHintMessage = format ["The convoy has been stopped<br/>The money, GOLD and vehicles are now yours to take.<br/>There is<br/><t color='%3'> $%1 </t><br/>in GOLD to collect." ,_goldAmount, moneyMissionColor,  goldTextColor];
};

_this call moneyMissionProcessor;
