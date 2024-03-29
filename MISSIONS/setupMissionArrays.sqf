// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

MainMissions =
[
	// Mission filename, weight
	
	//["mission_Coastal_Convoy", 1],
	//["mission_Convoy", 1],
	//["mission_HostileHeliFormation", 1],
	["mission_APC", 1.5],
	["mission_MBT", 2],
	["mission_ArmedHeli", 3]
	//["mission_CivHeli", 1]
];

SideMissions =
[
	//["mission_ArmedDiversquad", 1],
	//["mission_HostileHelicopter", 0.5],
	//["mission_MiniConvoy", 1.5],
	//["mission_SunkenSupplies", 0.5],
	["mission_TownInvasion", 2],
	//["mission_AirWreck", 1.5],
	//["mission_WepCache", 1.5],
	["mission_Outpost", 1.5],
	//["mission_HostileInfantry", 3],
	["mission_Truck", 1],
	["mission_Sniper", 2]
	//["mission_Smugglers", 1]
	//["mission_HostileJet", 0.5]
];


MoneyMissions =
[
	["mission_MoneyShipment", 1],
	["mission_SunkenTreasure", 0]
	//["mission_Hackers", 0.25],
	//["mission_Hackers", 0.25]
];

ExtraMissions =
[
	["mission_Hackers", 2],
	["mission_geoCache", 1]
];


GoldMissions =
[
	["mission_Gold", 1]
];

SabotageMissions =
[
	["mission_Sabotage", 1]
];


PatrolMissions =
[
	["mission_airportPatrol", 1]
];

BountyMissions =
[
	["mission_Bounty", 1]
];

MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]],["A3W_sideMissions", ["mission_HostileJet", "mission_Smugglers", "mission_Sniper"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]],["A3W_MoneyMissions", ["mission_Hackers"],["mission_MoneyShipment"]]]] call removeDisabledMissions;
ExtraMissions = [ExtraMissions, [["A3W_extraMissions", ["mission_Hackers"], ["mission_geoCache"]]]] call removeDisabledMissions;
GoldMissions = [GoldMissions, [["A3W_goldMissions", ["mission_Gold"]]]] call removeDisabledMissions;
SabotageMissions = [SabotageMissions, [["A3W_sabotageMissions", ["mission_Sabotage"]]]] call removeDisabledMissions;
BountyMissions = [BountyMissions, [["A3W_BountyMissions", ["mission_Bounty"]]]] call removeDisabledMissions;
PatrolMissions = [PatrolMissions, [["A3W_PatrolMissions", ["mission_airportPatrol"]]]] call removeDisabledMissions;

{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;
{ _x set [2, false] } forEach GoldMissions;
{ _x set [2, false] } forEach SabotageMissions;
{ _x set [2, false] } forEach PatrolMissions;
{ _x set [2, false] } forEach BountyMissions;

MissionSpawnMarkers = [];
SunkenMissionMarkers = [];
GoldMissionMarkers = [];
SabotageMissionMarkers = [];


{
	switch (true) do
	{
		case (["Mission_", _x] call fn_startsWith):
		{
			MissionSpawnMarkers pushBack [_x, false];
		};
		case (["SunkenMission_", _x] call fn_startsWith):
		{
			SunkenMissionMarkers pushBack [_x, false];
		};
		case (["GoldMission_", _x] call fn_startsWith):
		{
			GoldMissionMarkers pushBack [_x, false];
		};
		case (["SabotageMission_", _x] call fn_startsWith):
		{
			SabotageMissionMarkers pushBack [_x, false];
		};
	};
} forEach allMapMarkers;

LandConvoyPaths = [];
{
	LandConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "\server\scripts\convoys\landConvoysList.sqf");

CoastalConvoyPaths = [];
{
	CoastalConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "\server\scripts\convoys\coastalConvoysList.sqf");

PatrolConvoyPaths = [];
{
	PatrolConvoyPaths pushBack [_x, false];
} forEach (call compile preprocessFileLineNumbers "\server\scripts\convoys\patrolConvoysList.sqf");

