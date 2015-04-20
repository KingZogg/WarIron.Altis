// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) (START + floor random ((END - START) + 1))

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box allowDamage true; //  more fucking busted crates !!
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
	case "mission_USLaunchers":  //missions Coastal_Convoy, Convoy, HostileHeliFormation, Outposts, Airport Patrol, AirWreck, HostileHelicopter, MiniConvoy, SunkenSupplies ,TownInvasion, WepCache, sniperNest
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["launch_RPG32_F", "launch_NLAW_F"], RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(1,2)],
			//["wep", ["launch_Titan_short_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
			["wep", "launch_Titan_F", RANDOM_BETWEEN(2,3), RANDOM_BETWEEN(1,2)],
			["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,8)]
		];
	};
	case "mission_USSpecial": //as above including ArmedDiverSquad, SunkenTreasure,
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//["itm", "NVGoggles", 5],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(1,5)],
			["itm", ["optic_MRCO", "optic_Arco", "optic_Hamr", "optic_SOS", "optic_tws", "optic_Nightstalker","optic_KHS_hex","optic_AMS_khk"], RANDOM_BETWEEN(2,4)],
			["itm", ["muzzle_snds_M", "muzzle_snds_H", "muzzle_snds_H_MG", "muzzle_snds_B", "muzzle_snds_acp","muzzle_snds_93mmg","muzzle_snds_338_sand"], RANDOM_BETWEEN(1,3)],
			["itm", ["bipod_02_F_hex", "bipod_03_F_oli"], RANDOM_BETWEEN(1,3)],
			["wep", ["hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_MRD_F", "hgun_Pistol_heavy_02_F", "hgun_Pistol_heavy_02_Yorris_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(3,5)],
			["wep", ["arifle_MXM_F", "srifle_EBR_F", "srifle_DMR_01_DMS_F","srifle_DMR_04_F","srifle_DMR_05_hex_F","srifle_DMR_02_sniper_F","srifle_DMR_03_multicam_F","srifle_DMR_06_camo_F"], RANDOM_BETWEEN(3,4), RANDOM_BETWEEN(4,6)],
			["wep", ["LMG_Mk200_F", "LMG_Zafir_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(2,4)],
			["mag", "30Rnd_556x45_Stanag", RANDOM_BETWEEN(4,8)],
			["mag", "30Rnd_65x39_caseless_mag", RANDOM_BETWEEN(4,8)],
			["mag", "30Rnd_65x39_caseless_green", RANDOM_BETWEEN(4,8)],
			["mag", "30Rnd_65x39_caseless_green", RANDOM_BETWEEN(4,8)],
			["mag", "30Rnd_65x39_caseless_green", RANDOM_BETWEEN(4,8)],
			["mag", "9Rnd_45ACP_Mag", RANDOM_BETWEEN(1,5)]
		];
	};
	case "mission_Main_A3snipers": //costal_convoy, hostileHeliFormation, Outposts, airport Patrol, ArmedDiverSquad, sniperNest
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["srifle_LRR_SOS_F", "srifle_LRR_camo_SOS_F", "srifle_GM6_SOS_F", "srifle_GM6_camo_SOS_F", "srifle_DMR_04_Tan_F", "srifle_DMR_02_camo_F", "srifle_DMR_03_multicam_F", "srifle_DMR_06_camo_F"], RANDOM_BETWEEN(3,4), RANDOM_BETWEEN(6,8)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(2,4), RANDOM_BETWEEN(6,8)],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(1,3)],
			["itm", ["optic_MRCO", "optic_Arco", "optic_Hamr", "optic_SOS", "optic_tws", "optic_Nightstalker","optic_KHS_hex","optic_AMS_khk"], RANDOM_BETWEEN(2,4)],
			["itm", ["bipod_02_F_hex", "bipod_02_F_hex"], RANDOM_BETWEEN(1,3)]
		];
	};
	
	case "mission_WI_Gear1":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["itm", ["V_RebreatherB", "V_PlateCarrierIAGL_dgtl", "V_TacVest_camo", "V_PlateCarrierGL_rgr"], RANDOM_BETWEEN(1,4)],
			["itm", ["B_Kitbag_sgg", "B_Kitbag_mcamo"], RANDOM_BETWEEN(1,4)],
			["itm", ["U_B_HeliPilotCoveralls","U_B_Wetsuit","U_B_CombatUniform_mcam_vest", "U_B_GhillieSuit"], RANDOM_BETWEEN(1,4)],
			["itm", ["H_HelmetCrew_B","H_CrewHelmetHeli_B","H_HelmetB_plain_blk","H_HelmetSpecB"], RANDOM_BETWEEN(1,4)]
			
			
		];
	};
};

[_box, _boxItems] call processItems;
