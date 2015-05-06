// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: init.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Initialize Tactical Radio
//@file Argument: the path to the directory holding this file.
private ["_path","_ground_type", "_icon", "_take", "_can_take", "_use"];
_path = _this;

MF_ITEMS_SUPPLY_RADIO = "supplyradio";
MF_ITEMS_SUPPLY_RADIO_TYPE = "Land_PortableLongRangeRadio_F";
MF_ITEMS_SUPPLY_RADIO_MAX = ["config_items_supply_radio_max", 1] call getPublicVar;

_ground_type = "Land_PortableLongRangeRadio_F";
_icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa";


_use = [_path, "use.sqf"] call mf_compile;


mf_items_supply_radio_nearest = {
	_radio = objNull;
	_radio = nearestObjects [player, [MF_ITEMS_SUPPLY_RADIO_TYPE], 5];
	if (count _radio > 0) then {
		_radio = _radio select 0;
	};
	_radio;
} call mf_compile;

[MF_ITEMS_SUPPLY_RADIO, "Tactical Radio", _use , _ground_type, _icon, MF_ITEMS_SUPPLY_RADIO_MAX] call mf_inventory_create;

