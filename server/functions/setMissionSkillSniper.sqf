// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: setMissionSkill.sqf
//	@file Author: AgentRev
//	@file Created: 21/10/2013 19:14
//	@file Args:

if (!isServer) exitWith {};

private ["_unit", "_skill", "_accuracy"];
_unit = _this;

if (["A3W_missionsDifficulty"] call isConfigOn) then



{
	_unit allowFleeing 0;
	_unit setSkill ["aimingAccuracy", 0.3];
	_unit setSkill ["aimingShake", 0.6];
	_unit setSkill ["aimingSpeed", 0.6];
	_unit setSkill ["spotDistance", 1];
	_unit setSkill ["spotTime", 1];
	_unit setSkill ["courage", 1];
	_unit setSkill ["reloadSpeed", 1];
	_unit setSkill ["commanding", 1];
	_unit setSkill ["general", 1];
}
else
{
	_unit allowFleeing 0;
	_unit setSkill ["aimingAccuracy", 0.3];
	_unit setSkill ["aimingShake", 0.6];
	_unit setSkill ["aimingSpeed", 0.6];
	_unit setSkill ["spotDistance", 1];
	_unit setSkill ["spotTime", 1];
	_unit setSkill ["courage", 1];
	_unit setSkill ["reloadSpeed", 1];
	_unit setSkill ["commanding", 1];
	_unit setSkill ["general", 1];
}



//https://resources.bisimulations.com/wiki/setSkill