// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createRandomSoldier.sqf USED IN mission_convoy, Money Shipment, Airport Patrol, MiniConvoy
/*
 * Creates a random civilian soldier.
 *
 * Arguments: [ position, group, init, skill, rank]: Array
 *    position: Position - Location unit is created at.
 *    group: Group - Existing group new unit will join.
 *    init: String - (optional, default "") Command to be executed upon creation of unit. Parameter this is set to the created unit and passed to the code.
 *    skill: Number - (optional, default 0.5)
 *    rank: String - (optional, default "PRIVATE")
 */

if (!isServer) exitWith {};

private ["_soldierTypes", "_uniformTypes", "_vestTypes", "_weaponTypes","_launcherTypes", "_group", "_position", "_rank", "_soldier"];

_soldierTypes = ["C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F"];
_uniformTypes = ["U_B_CombatUniform_mcam_vest", "U_B_CombatUniform_mcam_tshirt" ,"U_B_CombatUniform_mcam"];
_vestTypes = ["V_Rangemaster_belt","V_Rangemaster_belt"];
_weaponTypes = ["arifle_TRG20_F","arifle_TRG21_GL_F","arifle_TRG20_Holo_F"];
_launcherTypes = ["launch_RPG32_F","launch_NLAW_F","launch_B_Titan_F"];

_group = _this select 0;
_position = _this select 1;
_rank = [_this, 2, "", [""]] call BIS_fnc_param;

_soldier = _group createUnit [_soldierTypes call BIS_fnc_selectRandom, _position, [], 0, "NONE"];
_soldier addUniform (_uniformTypes call BIS_fnc_selectRandom);
_soldier addVest (_vestTypes call BIS_fnc_selectRandom);
[_soldier, _weaponTypes call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;
//[_soldier, _launcherTypes call BIS_fnc_selectRandom, 1] call BIS_fnc_addWeapon;

_soldier addPrimaryWeaponItem "acc_flashlight";
_soldier enablegunlights "forceOn";					//set to "forceOn" to force use of lights (during day too default = AUTO)

	

if (_rank != "") then
{
	_soldier setRank _rank;
};

_soldier spawn refillPrimaryAmmo;
_soldier spawn addMilCap;
_soldier call setMissionSkill;

_soldier addEventHandler ["Killed", server_playerDied];

_soldier
