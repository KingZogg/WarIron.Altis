// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: createHeliGoldMarker.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, King Zog [git]
//	@file Args:

private ["_text", "_pos", "_marker","_marker2","_markername","_markername2"];

_text = _this select 0;
_pos = _this select 1;




_yradius = 500;
_xradius = 500;

			
			// Circle zone
			_markername = format ["mission_%1_%2", [_text] call fn_filterString, call A3W_fnc_generateKey];
			_marker = createMarker [_markername, _pos];
			_markername setMarkerShape "ELLIPSE";
			_markername setMarkerColor "ColorRed";
			_markername setMarkerSize [_yradius, _xradius];
			_markername setMarkerBrush "Grid";
			_markername setMarkerAlpha 0.5;
			
			//Marker Name
			_markername2 = format ["mission_%1", [_text]];
			_marker2 = createMarker [_markername2, _pos];
			_markername2 setMarkerShape "ICON";
			_markername2 setMarkerType "mil_dot";
			_markername2 setMarkerColor "ColorRed";
			_markername2 setMarkerSize [1,1];
			_markername2 setMarkerText "MINE FIELD (Sub Mission)";

// Return
//[_marker, _marker2]			
_marker


