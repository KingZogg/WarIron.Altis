// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf   Used in VehicleCapture, AirWreck, Outpost, Truck, WepCache
//	@file Author: AgentRev

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = [_this, 2, 7, [0]] call BIS_fnc_param;
_radius = [_this, 3, 10, [0]] call BIS_fnc_param;

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit addVest "V_Rangemaster_belt";
	_unit addMagazine "30Rnd_556x45_Stanag";
	_unit addMagazine "30Rnd_556x45_Stanag";
	_unit addMagazine "30Rnd_556x45_Stanag";

	switch (true) do
	{
		// Grenadier and RPG every 3 units
		case (_i % 3 == 0):
		{
			_unit addUniform "U_B_CombatUniform_mcam_vest";
			_unit addBackpack "B_Kitbag_mcamo";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addWeapon "arifle_TRG21_GL_F";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "RPG32_HE_F";
			_unit addWeapon "launch_RPG32_F";
			_unit addMagazine "RPG32_HE_F";
		};
		// AA every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addUniform "U_B_CombatUniform_mcam_tshirt";
			_unit addBackpack "B_Kitbag_mcamo";
			_unit addWeapon "arifle_TRG20_F";
			_unit addMagazine "Titan_AA";
			_unit addWeapon "launch_B_Titan_F";
			_unit addMagazine "Titan_AA";
		};
		// Rifleman
		default
		{
			_unit addUniform "U_B_CombatUniform_mcam";

			if (_unit == leader _group) then
			{
				_unit addWeapon "arifle_TRG21_F";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addWeapon "arifle_TRG20_F";
			};
		};
	};

	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enablegunlights "forceOn";

	_unit addRating 1e11;
	_unit spawn addMilCap;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos] call defendArea;
