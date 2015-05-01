// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createMissionMarkerFill.sqf
//	@file Author: AgentRev

//called by _marker = [_missionType, _missionPos, _search] call createMissionMarker;

private ["_text", "_pos", "_search", "_marker", "_marker2", "_markername", "_markername2", "_xpos", "_ypos", "_buildingRadius"];

//_xpos = ceil(random (700) - 350);
//_ypos = ceil(random (700) - 350);
//_zpos = 0;

_text = _this select 0;
_pos = _this select 1;
_buildingRadius = _this select 2;
//_buildingRadius = if (_buildingRadius >= 300 ) then {(_buildingRadius == 295 )} else {_buildingRadius - 5};


			// Circle zone
			_markername = format ["mission_%1_%2", [_text] call fn_filterString, call A3W_fnc_generateKey];
			//_marker = createMarker [_markername, (_pos vectorAdd [_xpos,_ypos,_zpos])];
			_markerFill = createMarker [_markername, _pos ];
			_markername setMarkerShape "ELLIPSE";
			_markername setMarkerColor "ColorWhite";
			_markername setMarkerSize [_buildingRadius, _buildingRadius];
			_markername setMarkerBrush "FDiagonal";
			_markername setMarkerAlpha 0.6;
			
			
sleep 1;		

//diag_log format ["#################### CreateMissionMarker Search Value In Then = %1", _search];



_markerFill


