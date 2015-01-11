// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: pack.sqf
//@file Author: MercyfulFate, KingZog [git]
//@file Created: 23/7/2013 16:00
//@file Description: Take the nearest gold box
//@file Argument: [player, player, _action, []] the standard "called by an action" values

#include "mutex.sqf"
#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define DURATION 2
#define ERR_TOO_FAR_AWAY "Taking Gold Failed. You moved too far away"
#define ERR_ALREADY_TAKEN "Taking Gold Failed. Someone else beat you to it."
#define ERR_IN_VEHICLE "Taking Gold Failed. You can't do this in a vehicle."
#define ERR_CANCELLED "Taking Gold Cancelled"

private ["_error", "_hasFailed", "_success", "_gold", "_text", "_failed", "_progress"];
_gold = [] call mf_items__gold_bullion_nearest;
_error = [_gold] call mf_items_gold_bullion_can_take;
if (_error != "") exitWith {[_error, 5] call mf_notify_client};

_hasFailed = {
	private ["_progress", "_gold", "_failed", "_text"];
	_progress = _this select 0;
	_gold = _this select 1;
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player): {}; // player dead, no error msg needed
		case (isNull _gold): {_text = ERR_ALREADY_TAKEN}; //someone has already taken it.
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (player distance _gold > 5): {_text = ERR_TOO_FAR_AWAY};
		case (doCancelAction): {doCancelAction = false; _text = ERR_CANCELLED};
		default {
			_text = format["Gold Box %1%2 Taken", round(_progress*100), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};

MUTEX_LOCK_OR_FAIL;
_success =  [DURATION, ANIM, _hasFailed, [_gold]] call a3w_actions_start;
MUTEX_UNLOCK;

if (_success) then {
	deleteVehicle _gold;
	[MF_ITEMS_GOLD_BULLION, 1] call mf_inventory_add;
	["You took some gold bullion", 5] call mf_notify_client;
};
