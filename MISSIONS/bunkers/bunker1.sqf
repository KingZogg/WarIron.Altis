// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: Bunker1.sqf
//	@file Author: JoSchaap, AgentRev

[
// Class, Position, Direction, Init (optional)
["Land_BagFence_Round_F",[1.30,-2.70,-0.0013], 127],
["Land_BagBunker_Large_F",[6.59,-6.55,-0.200], 313],
["I_HMG_01_high_F",[2.83,-3.55,-0.086], 309, { if (random 1 < 0.2) exitWith { deleteVehicle _this }; [_this] call vehicleSetup }],
["I_HMG_01_high_F",[3.59,-7.75,-0.033], 230, { if (random 1 < 0.5) exitWith { deleteVehicle _this }; [_this] call vehicleSetup }],
["I_HMG_01_high_F",[8.95,-4.61,-0.033], 50, { if (random 1 < 0.6) exitWith { deleteVehicle _this }; [_this] call vehicleSetup }],
["I_HMG_01_high_F",[8.61,-8.81,-0.033], 130, { if (random 1 < 0.8) exitWith { deleteVehicle _this }; [_this] call vehicleSetup }]

]

/*
["Land_BagFence_Round_F",[1.30664,-2.70898,-0.00130081],127,1,0],
["B_GMG_01_high_F",[2.83203,-3.55273,-0.0868092],309.001,1,0],
["B_GMG_01_high_F",[3.5918,-7.75586,-0.0334721],230.001,1,0],
["Land_BagBunker_Large_F",[6.59668,-6.55664,-0.200006],313,1,0],
["B_GMG_01_high_F",[8.95801,-4.61328,-0.0334778],49.9999,1,0],
["Land_Flush_Light_green_F",[0.144531,11.2441,0],354,1,0],
["Land_Flush_Light_green_F",[11.9258,-0.0136719,0],354,1,0],
["B_GMG_01_high_F",[8.61133,-8.81641,-0.0334721],130.005,1,0],
["Land_Flush_Light_green_F",[11.5039,-14.1133,0],354,1,0],