wakOnAction = ["<t color='#ffff33'>Insert Earplugs</t>", "addons\earplug\actionManager.sqf", [], -90, false, true, "", "_target == vehicle player"];
if (playerSide != Civilian) then {
	0.5 fadeSound 1;
	{_x addAction wakOnAction;
	_x addEventHandler ["Respawn", {
		_unit = _this select 0;
		0.5 fadeSound 1;
		_unit addAction wakOnAction;
	}];
	} forEach playableUnits;
};