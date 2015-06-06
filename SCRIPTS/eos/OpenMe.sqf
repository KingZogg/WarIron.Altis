EOS_Spawn = compile preprocessfilelinenumbers "\server\scripts\eos\core\eos_launch.sqf";Bastion_Spawn=compile preprocessfilelinenumbers "\server\scripts\eos\core\b_launch.sqf";null=[] execVM "\server\scripts\eos\core\spawn_fnc.sqf";onplayerConnected {[] execVM "\server\scripts\eos\Functions\EOS_Markers.sqf";};
/* EOS 1.98 by BangaBob 
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/
VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER= 2;	// 1 is default
EOS_KILLCOUNTER=true;		// Counts killed units

null = [["G1"], //["MARKERNAME","MARKERNAME2"]
[0,1],   					//[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY]
[2,1],					//[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY]
[1,1,50],						//[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY]
[0,0],						//[ARMOURED VEHICLES,PROBABILITY]
[0.0],						//[STATIC VEHICLES,PROBABILITY]
[0,0],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY]
[0,1,350,EAST,TRUE,FALSE]		//[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]
] call EOS_Spawn;

null = [["G3"], //["MARKERNAME","MARKERNAME2"]
[1,1],   					//[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY]
[2,2],					//[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY]
[1,1],						//[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY]
[0],						//[ARMOURED VEHICLES,PROBABILITY]
[4,60],						//[STATIC VEHICLES,PROBABILITY]
[1,2,20],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY]
[0,1,350,EAST,TRUE,FALSE]		//[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]
] call EOS_Spawn;

null = [["G2","G4","G5","G6","G7","G8"], //["MARKERNAME","MARKERNAME2"]
[1,1],   					//[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY]
[2,1],					//[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY]
[1,1,30],						//[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY]
[0,0],						//[ARMOURED VEHICLES,PROBABILITY]
[0.0],						//[STATIC VEHICLES,PROBABILITY]
[0,0],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY]
[0,1,350,EAST,TRUE,FALSE]		//[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]
] call EOS_Spawn;

null = [["T1","T3"], //["MARKERNAME","MARKERNAME2"]
[0,1],   					//[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY]
[3,2],					//[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY]
[0,0],						//[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY]
[0,0],						//[ARMOURED VEHICLES,PROBABILITY]
[3,50],						//[STATIC VEHICLES,PROBABILITY]
[1,0,30],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY]
[0,1,700,EAST,FALSE,FALSE]		//[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]
] call EOS_Spawn;

null = [["T2"], //["MARKERNAME","MARKERNAME2"]
[0,1],   					//[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY]
[3,1],					//[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY]
[1,2],						//[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY]
[1],						//[ARMOURED VEHICLES,PROBABILITY]
[3,50],						//[STATIC VEHICLES,PROBABILITY]
[1,0,30],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY]
[0,1,700,EAST,FALSE,FALSE]		//[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]
] call EOS_Spawn;

null = [["T4","T5","T6","T7","T8"], //["MARKERNAME","MARKERNAME2"]
[0,1],   					//[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY]
[4,1],					//[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY]
[1,1,30],						//[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY]
[0,0],						//[ARMOURED VEHICLES,PROBABILITY]
[1,50],						//[STATIC VEHICLES,PROBABILITY]
[1,1,50],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY]
[0,1,700,EAST,FALSE,FALSE]		//[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]
] call EOS_Spawn;


null = [["H1","H2","H3","H4","H5","H6","H7","H8"], //["MARKERNAME","MARKERNAME2"]
[1,1,50],   					//[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY]
[2,1],					//[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY]
[0,0],						//[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY]
[0,0],						//[ARMOURED VEHICLES,PROBABILITY]
[0.0],						//[STATIC VEHICLES,PROBABILITY]
[0,0],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY]
[0,1,350,EAST,TRUE,FALSE]		//[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]
] call EOS_Spawn;

null = [["M1"], //["MARKERNAME","MARKERNAME2"]
[2,1],   					//[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY]
[3,1],					//[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY]
[1,1,25],						//[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY]
[0,0],						//[ARMOURED VEHICLES,PROBABILITY]
[0.0],						//[STATIC VEHICLES,PROBABILITY]
[1,0],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY]
[0,1,700,EAST,TRUE,FALSE]		//[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]
] call EOS_Spawn;



null = [["S1","S2","S3","S4","S5","S6","S7"], //["MARKERNAME","MARKERNAME2"]
[1,1],   					//[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY]
[2,1],					//[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY]
[0,0],						//[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY]
[0],						//[ARMOURED VEHICLES,PROBABILITY]
[0],						//[STATIC VEHICLES,PROBABILITY]
[1,0,30],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY]
[0,0,350,EAST,TRUE,FALSE]		//[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]
] call EOS_Spawn;


/*
null = [["S1"],//["MARKERNAME","MARKERNAME2"]
[0,0], //[PATROL GROUPS,SIZE OF GROUPS]
[0,0],//[LIGHT VEHICLES,SIZE OF CARGO]
[0],//[ARMOURED VEHICLES]
[1,2],//[HELICOPTERS,SIZE OF HELICOPTER CARGO]
[0,1,EAST,FALSE,FALSE],//[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG]
[0,2,240,TRUE,FALSE]//[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]
] call Bastion_Spawn;

/*
null = [["SN_1"], 			//["MARKERNAME","MARKERNAME2"]
[1,1],						//[PATROL GROUPS,SIZE OF GROUPS]
[1,1],						//[LIGHT VEHICLES,SIZE OF CARGO]
[2],							//[ARMOURED VEHICLES]
[1,1],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO]
[0,0,EAST,FALSE,TRUE],		//[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG]
[10,2,30,TRUE,TRUE]			//[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]
] call Bastion_Spawn;



/*
null = [["SN_1"], //["MARKERNAME","MARKERNAME2"]
[1,1],						//[PATROL GROUPS,SIZE OF GROUPS]
[0,2],						//[LIGHT VEHICLES,SIZE OF CARGO]
[0],							//[ARMOURED VEHICLES]
[1,2],						//[HELICOPTERS,SIZE OF HELICOPTER CARGO]
[0,0,EAST,TRUE,TRUE],			//[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG]
[0,2,15,FALSE,FALSE]			//[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]
] call Bastion_Spawn;





