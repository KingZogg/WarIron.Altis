//	@file Name: sabotageMissionController.sqf

#define MISSION_CTRL_PVAR_LIST sabotageMissions
#define MISSION_CTRL_TYPE_NAME "Sabotage"
#define MISSION_CTRL_FOLDER "sabotageMissions"
#define MISSION_CTRL_DELAY (["A3W_sabotageMissionDelay", 1*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE sabotageMissionColor

#include "sabotageMissions\sabotageMissionDefines.sqf"
#include "missionController.sqf";
