// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Sabotage.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev


if (!isServer) exitwith {};
#include "sideMissionDefines.sqf"

_goldPrice = ["A3W_goldPrice", 25000] call getPublicVar;

private ["_missionPos", "_goldAmount", "_goldPrice", "_goldMinAmount", "_goldMaxAmount","_missionHintTime"];

_setupVars =
{
	_missionType = "Sabotage";

	
_positions = [

[9195.8,8370.3], 
[9133.44,8393.21],
[9075.91,8328.12],
[9021.03,8310.11],

[10233.2,8641.87],
[10283.3,8679.63],
[10335.6,8741.37],
[10388.6,8761.14],
[10450.2,8753.4],

[9889.58,7871.61],
[9936.74,7888.09],
[9979.31,7881.71],

[10488.4,7663.46],
[10559.4,7650.42],
[10631.6,7639.36],
[10688.6,7602.38],
[10743.3,7624.44],
[10808.4,7597.64],
[10903.8,7621.73],
[10977.3,7639.6],
[11020.1,7688.92],
[11079.7,7664.35],

[11628.6,7564.35],
[11679.3,7592.92],
[11745.1,7577.89],
[11796.5,7603.03],
[11904.7,7583.88],
[11946.7,7598.47],
[12025.3,7589.74],
[12089.1,7562.88],

[12131.5,7427.47],
[12202.3,7422.2],
[12265.1,7397.66],
[12354.8,7409.16],

[12473.8,6973.6],
[12540,6971],
[12649,6938.67],
[12724.5,6956.08],
[12815.7,7047.22],
[12872,7093.31]

//[11219.3,8613.71],
//[11266.1,8613.53],
//[11310.6,8578.34]
];

    
 _missionPos = _positions call BIS_fnc_SelectRandom;

  while {!alive nearestObject [_missionPos, "Land_wpp_Turbine_V2_F"]} do {_missionPos = _positions call BIS_fnc_SelectRandom;}
	
};

_setupObjects =
{
	
	
	_missionHintTime = ["A3W_sideMissionTimeout", 120] call getPublicVar;
	_missionHintTime = _missionHintTime /60;
	
	//private ["_title", "_subTitle", "_picture", "_text", "_titleColor"];
	_missionHintText = format ["Destroy the wind turbine nearest the marker.<br/><br/> Get in and get out.<br/>Stealth and explosives recommend.<br/>The whole area is crawling with Opfor.<br/>You have %2 Minutes<br/>To destroy it.", sideMissionColor, _missionHintTime];
};

_ignoreAiDeaths = true;
_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_waitUntilSuccessCondition = { !alive nearestObject [_missionPos, "Land_wpp_Turbine_V2_F"]  };

	
_failedExec =
{
	// Mission failed
	
};

_successExec =
{
	// Mission completed
	_goldAmount = 0;
	_goldMinAmount = 1;
	_goldMaxAmount = 5;
	_goldAmount = _goldMinAmount + ceil(random _goldMaxAmount);
	
	for "_i" from 1 to _goldAmount do{
		
		_gold = createVehicle ["Land_TinContainer_F", _missionPos, [], 0, "None"];
		//_gold setPosATL (getPosATL _vehicle vectorAdd [(ceil(random (16) - 8)),(ceil(random (16) - 8)),1]);
		};
		
	_goldAmount = _goldAmount * _goldPrice;
	
	
	_successHintMessage = format ["Turbine destroyed.<br/>There is<br/><t color='%3'> $%1 </t><br/>in gold to collect." ,_goldAmount, sideMissionColor, goldTextColor];
};

_this call sideMissionProcessor;
