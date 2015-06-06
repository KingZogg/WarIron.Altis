//@file Version: 1.0
//@file Name: building_lock.sqf
//@file Author:  BadVolt
//@file Created: 28/12/2014
//@file Description: Lock building

#include "allowedBuildings.sqf"
#define DURATION 5
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_IN_VEHICLE "Locking Failed! You can't do that in a vehicle."
#define ERR_NO_DOORS "Locking Failed! This building do not have doors."
#define ERR_DESTROYED "Locking Failed! The building is too damaged to lock."
#define ERR_TOO_FAR_AWAY "Locking Failed! You are too far away from the building."
#define ERR_NOT_BUILDING "Locking Failed! This is not a building."
#define ERR_NOT_ALLOWED "Locking Failed! You are not allowed to lock this."
#define ERR_NOT_OWNER "Locking Failed! You do not own this building."
#define ERR_CANCELLED "Locking Cancelled!"

private ["_building", "_checks", "_success"];

_building = cursorTarget;
_doorsAmount = [_building] call fn_getDoorsAmount;
_totalDuration = DURATION * _doorsAmount;

_checks = {
    private ["_progress","_failed", "_text"];
    _progress = _this select 0;
    _building = _this select 1;
    _text = "";
    _failed = true;
    switch (true) do {
		case (!alive player): {}; // player is dead, no need for a notification
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (!alive _building): {_error = ERR_DESTROYED};
		case (([_building] call fn_getDoorsAmount)<1): {_text = ERR_NO_DOORS};
		case (player distance _building > (sizeOf typeOf _building / 2) max 15): {_text = ERR_TOO_FAR_AWAY};
		case (!(_building isKindOf 'Building')): {_text = ERR_NOT_BUILDING}; 	//Not building
		case (!(typeOf _building in _allowedList)): {_text = ERR_NOT_ALLOWED}; //Not in allowed list
		case ((_building getVariable ["ownerUID",""]) != (getPlayerUID player)) : {_text = ERR_NOT_OWNER}; //Not owned by player
		case (([_building] call fn_allDoorsLocked)): {}; //All doors are locked
		
		case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
		
        default {
            _text = format["Building Locking %1%2 Complete", round(100 * _progress), "%"];
            _failed = false;
        };
    };
    [_failed, _text];
};

_success = [_totalDuration, ANIMATION, _checks, [_building]] call a3w_actions_start;

if (_success) then {

		for "_i" from 1 to _doorsAmount do {
			//Close all Doors
			[_building, format ['Door_%1_rot',_i], format ['Door_Handle_%1_rot_1',_i] , format ['Door_Handle_%1_rot_2',_i]] execVM "\A3\Structures_F\scripts\Door_close.sqf";
			//Lock all Doors
			_building setVariable [format ["bis_disabled_Door_%1",_i],1,true];
		};

	["Building Lock complete!", 5] call mf_notify_client;
};
_success;