// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HackLaptop.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "moneyMissionDefines.sqf";

private ["_positions", "_camonet", "_laptop", "_randomGroup", "_vehicleName","_table"];

		"packet" addPublicVariableEventHandler {
        _playerUID = _this select 1;
         };



_setupVars =
{
	_missionType = "Hackers";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	_table = createVehicle ["Land_WoodenTable_small_F", _missionPos, [], 0, "CAN COLLIDE"];
	//_table setPosASL [_missionPos select 0, _missionPos select 1];
	
	_laptop = createVehicle ["Land_Laptop_unfolded_F", _missionPos, [], 0, "CAN COLLIDE"];
	_laptop attachTo [_table,[0,0,0.60]];
		
	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";

	_laptop setVariable [ "Done", false, true ];
		
	_vehicleName = "Land_SatellitePhone_F";
	_missionHintText = format ["<t color='%2'>Hackers</t> are using a laptop to hack your bank accounts. Hacking the laptop successfully will steal 1.5 percent from each on-line players bank account! HURRY TO DEFEND YOUR BANK ACCOUNT OR HACK OTHERS BANK ACCOUNTS!", _vehicleName, moneyMissionColor];
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
	
	diag_log format ["Player Server %1", _playerUID];	
    	
	// Mission completed
	
	// Give Reward to the hacker
		_totalMoney = 0;
		
		{   
			if (isPlayer _x) then {
			_bmoney = _x getVariable ["bmoney",0];
			if ( _bmoney > 0 ) then { //might as well check for zero's
			_fivePercent = round(0.015*_bmoney);
			_x setVariable [ "bmoney", (_bmoney - _fivePercent), true ];
			[] spawn fn_savePlayerData;
			_totalMoney = _totalMoney + _fivePercent;
		}
			}
		
			
		} forEach playableUnits;
	
		
		if (_totalMoney > 25000) then {
			player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _totalMoney, true];
			//[] spawn fn_savePlayerData;
			//systemChat format["You have hacked players bank accounts to the value of $%1",_totalMoney];	
			}
		else 	{
			player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + 25000, true];
			//[] spawn fn_savePlayerData;
			//systemChat format["$25,000 is all that was available"];				
				};

	
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_laptop, _table];
	//{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_obj];

	_successHintMessage = format ["Bank accounts have been hacked"];
};

_this call moneyMissionProcessor;