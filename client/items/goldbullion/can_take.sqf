// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: can_take.sqf 
//@file Author: MercyfulFate, KingZog [git]
//@file Created: 23/7/2013 16:00
//@file Description: Check if you can take the gold
//@file Argument: [_gold] the (object that is a) gold box to see if you can take it.
//@file Argument: [] automatically find the closest gold box to check.

#define ERR_NO_TARGET "You are not close enough to gold boxes"
#define ERR_TOO_FAR_AWAY "You are too far away from a gold box"
#define ERR_ALREADY_HAVE "You can not carry any more gold boxes"
private ["_gold", "_error"];
_gold = objNull;

if (count _this == 0) then {
	_gold = [] call mf_items__gold_bullion_nearest;
} else {
	_gold = _this select 0;
};

_error = "";
switch (true) do {
	case (!alive player): {_error = " "}; // Player is dead, no need for a error message
	case (player distance _gold > 5): {_error = ERR_TOO_FAR_AWAY};
	case (MF_ITEMS_GOLD_BULLION call mf_inventory_is_full): {_error = ERR_ALREADY_HAVE};
};
_error;
