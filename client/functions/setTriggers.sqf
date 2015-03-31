if (!hasInterface) exitWith {};

if (!isDedicated) then {
    _triggersSet = 0 spawn {
        waitUntil {!isNil "triggersMade"};
        {
            _trID = _x getVariable ["trID", -1];
            			
			if (_trID == 0) then {
               _x setTriggerArea [6500, 13000, 32, false];
               _x setTriggerActivation ["ANY", "PRESENT", true];
			   _x setTriggerStatements [
						"((vehicle player) in thisList) and ((getPos (vehicle player) select 2) < 2)",
						"radZone = [1800] execVM 'addons\rad\radZone.sqf'; terminate radZoneWarning",
						"radZoneWarning = [1800] execVM 'addons\rad\radZoneWarning.sqf'; terminate radZone"
				];		
            }
			else
			{
			if (_trID == 1) then {
               _x setTriggerArea [6600, 13100, 32, false];
               _x setTriggerActivation ["ANY", "PRESENT", true];
			   _x setTriggerStatements [
						"((vehicle player) in thisList) and ((getPos (vehicle player) select 2) < 2)",
						"radZoneWarning = [1800] execVM 'addons\rad\radZoneWarning.sqf'",
						"hint''; terminate radZoneWarning ; terminate radZone"
				];		
            };
			
			};
		
		
        } forEach allMissionObjects "EmptyDetector";
    };
    
};