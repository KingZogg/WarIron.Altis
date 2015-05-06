// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: init.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Initialize Camo Net
//@file Argument: the path to the directory holding this file.
private ["_path","_ground_type", "_icon", "_take", "_can_take", "_use"];
_path = _this;

MF_ITEMS_GOLD_BULLION = "goldbullion";
MF_ITEMS_GOLD_BULLION_TYPE = "Land_TinContainer_F";
MF_ITEMS_GOLD_BULLION_MAX = ["config_items_gold_bullion_max", 1] call getPublicVar;

_ground_type = "Land_TinContainer_F";
_icon = "client\icons\gold.paa";

//_can_take = [_path, "can_take.sqf"] call mf_compile;
_take = [_path, "take.sqf"] call mf_compile;
_use = [_path, "use.sqf"] call mf_compile;

mf_items_gold_bullion_can_take = [_path, "can_take.sqf"] call mf_compile;
mf_items_gold_bullion_nearest = {
	_gold = objNull;
	_golds = nearestObjects [player, [MF_ITEMS_GOLD_BULLION_TYPE], 5];
	if (count _golds > 0) then {
		_gold = _golds select 0;
	};
	_gold;
} call mf_compile;

[MF_ITEMS_GOLD_BULLION, "Gold", _use, _ground_type, _icon, MF_ITEMS_GOLD_BULLION_MAX] call mf_inventory_create;


private ["_label", "_condition", "_action"];
_label = format["<img image='%1' /> Pickup Gold", _icon];
_condition = "'' == [] call mf_items_gold_bullion_can_take;";
_action = [_label, _take, [], 1, true, false, "", _condition];
["take-bullion", _action] call mf_player_actions_set;
