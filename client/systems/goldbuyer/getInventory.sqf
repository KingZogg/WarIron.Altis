// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getInventory.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\GoldBuyerDefines.sqf";
disableSerialization;

private ["_dialog", "_itemlisttext", "_itemlist", "_class", "_qty", "_listIndex"];

// Grab access to the controls
_dialog = findDisplay goldbuyer_DIALOG;
_itemlisttext = _dialog displayCtrl goldbuyer_item_TEXT;
_itemlist = _dialog displayCtrl goldbuyer_sell_list;

//Clear the list
lbClear _itemlist;
_itemlist lbSetCurSel -1;

{
	_class = _x select 0;
	_qty = _x select 1;

	if (_qty > 0) then
	{
		{
			if (_class == _x select 1) exitWith
			{
				for "_i" from 1 to _qty do
				{
					_listIndex = _itemlist lbAdd format ["%1", _x select 0];
					_itemlist lbSetPicture [_listIndex, _x select 3];
					_itemlist lbSetData [_listIndex, _x select 1];
				};
			};
		} forEach call customGoldPlayerItems;
	};
} forEach call mf_inventory_all;
