//	@file Name: sabotageMissionProcessor.sqf

#define MISSION_PROC_TYPE_NAME "Sabotage"
#define MISSION_PROC_TIMEOUT (["A3W_sabotageMissionTimeout", 30*60] call getPublicVar)
#define MISSION_PROC_COLOR_DEFINE sabotageMissionColor

#include "sabotageMissions\sabotageMissionDefines.sqf"
#include "missionProcessor.sqf";
