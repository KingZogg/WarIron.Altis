_unit0 = _this select 0;
_unit1 = _this select 1;
_act = _this select 2;
_unit0 removeAction _act;
if (soundVolume == 0.3) then {
	0.5 fadeSound 1;
	_unit1 addAction wakOnAction;
} else {
	0.5 fadeSound 0.3;
	_unit1 addAction ["<t color='#ffff33'>Remove Earplugs</t>", "addons\earplug\actionManager.sqf", [], -90, false, true, "", "_target == vehicle player"];
};