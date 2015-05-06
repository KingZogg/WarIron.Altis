//Init for Airdrop Assistance
//Author: Apoc
//
#include "config.sqf"

if (isServer) then {
APOC_srv_startAirdrop 	= compile preprocessFileLineNumbers "addons\APOC\APOC_srv_startAirdrop.sqf"; 
};



