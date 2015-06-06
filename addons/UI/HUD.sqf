ICE_HUD = 
{
    waitUntil {!isNull player};
    if (!local Player) exitWith {};

	disableSerialization; 
    ("ICE_Layer" call BIS_fnc_rscLayer) cutRsc ["TAG_ICEHUD","PLAIN"];
	
    _display = uiNamespace getVariable "TAG_ICE_display"; 
    _ctrlDir = _display displayCtrl 520500; 
    _ctrlFps = _display displayCtrl 520501;
		
    private "_heading";
    while {!isNull _display} do {
	
	    sleep 0.1;
        _ctrlFps ctrlSetText format ["%1", round diag_fps];
				
		If (vehicle player != player) Then {
            _dir = getDir vehicle player;
			switch (true) do {
			    case (_dir >= 337.5 || _dir < 22.5): {_heading = "N";};
				case (_dir >= 292.5 && _dir < 337.5): {_heading = "NW";};
				case (_dir >= 247.5 && _dir < 292.5): {_heading = "W";};
			    case (_dir >= 202.5 && _dir < 247.5): {_heading ="SW";};
			    case (_dir >= 157.5 && _dir < 202.5): {_heading ="S";};
				case (_dir >= 112.5 && _dir < 157.5): {_heading ="SE";};
				case (_dir >= 67.5 && _dir < 112.5): {_heading ="E";};
				case (_dir >= 22.5 && _dir < 67.5): {_heading ="NE";};
			};
		        _ctrlDir ctrlSetText format ["%1", _heading];
 
        } Else {
            _dir = getDir player;
		    switch (true) do {
			    case (_dir >= 337.5 || _dir < 22.5): {_heading = "N";};
				case (_dir >= 292.5 && _dir < 337.5): {_heading = "NW";};
			    case (_dir >= 247.5 && _dir < 292.5): {_heading = "W";};
				case (_dir >= 202.5 && _dir < 247.5): {_heading ="SW";};
				case (_dir >= 157.5 && _dir < 202.5): {_heading ="S";};
				case (_dir >= 112.5 && _dir < 157.5): {_heading ="SE";};
				case (_dir >= 67.5 && _dir < 112.5): {_heading ="E";};
				case (_dir >= 22.5 && _dir < 67.5): {_heading ="NE";};
			};
		        _ctrlDir ctrlSetText format ["%1", _heading];
        };
			
    };
		
};



