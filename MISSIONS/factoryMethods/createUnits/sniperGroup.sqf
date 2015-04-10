//	@file Version: 1.0
//	@file Name: smallGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 21:58
//	@file Args:

if (!isServer) exitWith {};

private ["_group","_pos","_skill","_leader","_man2","_man3","_man4","_man5","_man6"];

_group = _this select 0;
_pos = _this select 1;
_skill = if (["A3W_missionsDifficulty", 0] call getPublicVar > 0) then { 0.5 } else { 0.25 };

// Sniper
_leader = _group createUnit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 1, "Form"];
_leader addUniform "U_B_FullGhillie_sard";
_leader addVest "V_PlateCarrierIA1_dgtl";
_leader addWeapon "srifle_DMR_02_F";
_leader addPrimaryWeaponItem "optic_Nightstalker";
_leader addMagazine "10Rnd_338_Mag";
_leader addMagazine "10Rnd_338_Mag";
_leader addMagazine "10Rnd_338_Mag";
_leader addMagazine "10Rnd_338_Mag";
_leader addMagazine "HandGrenade";

// Sniper
_man2 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
_man2 addUniform "U_I_FullGhillie_ard";
_man2 addVest "V_PlateCarrierIA1_dgtl";
_man2 addWeapon "srifle_GM6_SOS_F";
_man2 addMagazine "5Rnd_127x108_APDS_Mag";
_man2 addMagazine "5Rnd_127x108_APDS_Mag";
_man2 addMagazine "5Rnd_127x108_APDS_Mag";
_man2 addMagazine "HandGrenade";

// Sniper
_man3 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
_man3 addUniform "U_I_Ghilliesuit";
_man3 addVest "V_PlateCarrierIA1_dgtl";
_man3 addWeapon "srifle_DMR_05_blk_F";
_man3 addPrimaryWeaponItem "optic_AMS_snd";
_man3 addMagazine "10Rnd_93x64_DMR_05_Mag";
_man3 addMagazine "10Rnd_93x64_DMR_05_Mag";
_man3 addMagazine "10Rnd_93x64_DMR_05_Mag";
_man3 addMagazine "HandGrenade";



// Spotter
_man4 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
_man4 addUniform "U_O_FullGhillie_lsh";
_man4 addVest "V_PlateCarrierIA1_dgtl";
_man4 addWeapon "srifle_EBR_SOS_F";
_man4 addMagazine "20Rnd_762x51_Mag";
_man4 addMagazine "20Rnd_762x51_Mag";
_man4 addMagazine "20Rnd_762x51_Mag";
_man4 addMagazine "HandGrenade";
_man4 addItem "Rangefinder";

// Spotter
_man5 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
_man5 addUniform "U_I_Ghilliesuit";
_man5 addVest "V_PlateCarrierIA1_dgtl";
_man5 addWeapon "srifle_EBR_SOS_F";
_man5 addMagazine "20Rnd_762x51_Mag";
_man5 addMagazine "20Rnd_762x51_Mag";
_man5 addMagazine "20Rnd_762x51_Mag";
_man5 addMagazine "HandGrenade";
_man5 addItem "Rangefinder";

// Spotter
_man6 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
_man6 addUniform "U_I_FullGhillie_sard";
_man6 addVest "V_PlateCarrierIA1_dgtl";
_man6 addWeapon "srifle_EBR_SOS_F";
_man6 addMagazine "20Rnd_762x51_Mag";
_man6 addMagazine "20Rnd_762x51_Mag";
_man6 addMagazine "20Rnd_762x51_Mag";
_man6 addMagazine "HandGrenade";
_man6 addItem "Rangefinder";

_man7 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
removeAllAssignedItems _man7;
_man7 addUniform "U_B_CTRG_1";
_man7 addVest "V_HarnessOSpec_brn";
_man7 addBackpack "B_FieldPack_ocamo";
_man7 addMagazine "10Rnd_762x51_Mag";
_man7 addWeapon "srifle_DMR_01_F";
_man7 addPrimaryWeaponItem "optic_Holosight";
_man7 addMagazine "10Rnd_762x51_Mag";
_man7 addMagazine "10Rnd_762x51_Mag";
_man7 addMagazine "HandGrenade";
_man7 addMagazine "Titan_AA";
_man7 addWeapon "launch_I_Titan_F";
_man7 addMagazine "Titan_AA";
_man7 addHeadgear "H_Booniehat_mcamo";
_man7 addGoggles "G_Balaclava_blk";

_man8 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
removeAllAssignedItems _man8;
_man8 addUniform "U_B_CTRG_1";
_man8 addVest "V_HarnessOSpec_brn";
_man8 addBackpack "B_FieldPack_ocamo";
_man8 addMagazine "10Rnd_762x51_Mag";
_man8 addWeapon "srifle_DMR_01_F";
_man8 addPrimaryWeaponItem "optic_Holosight";
_man8 addMagazine "10Rnd_762x51_Mag";
_man8 addMagazine "10Rnd_762x51_Mag";
_man8 addMagazine "HandGrenade";
_man8 addMagazine "NLAW_F";
_man8 addWeapon "launch_NLAW_F";
_man8 addMagazine "NLAW_F";
_man8 addHeadgear "H_Booniehat_mcamo";
_man8 addGoggles "G_Balaclava_blk";


sleep 0.1; // Without this delay, headgear doesn't get removed properly

_leader = leader _group;

{
	_x call setMissionSkill;
	_x allowFleeing 0;
	_x addRating 9999999;
	_x addEventHandler ["Killed", server_playerDied];
} forEach units _group;

[_group, _pos] call defendArea;
