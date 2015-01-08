// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: createHeliGoldMarker.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, King Zog [git]
//	@file Args:

//private ["_text", "_pos", "_marker"];
private ["_markerName", "_wreckPos", "_marker"];

_radius = 300;
_status = [];
_wreckMarker = [];
_col_empty = "ColorYellow";
_col_enemy = "ColorRed";
_col_friendly = "ColorGreen";
_col_mixed = "ColorOrange";

//Creates the marker around HeliGoldMission.
{
	
        //_wreckPos = markerPos _missionLocation;
		
		
			// Circle zone
			_markerName = format["LOST GOLD"];
			deleteMarkerLocal _markerName;
			_marker = createMarkerLocal [_markerName, _wreckPos];
			_markerName setMarkerShapeLocal "ELLIPSE";
			_markerName setMarkerColorLocal _col_empty;
			_markerName setMarkerSizeLocal [_radius, _radius];
			_markerName setMarkerBrushLocal "Grid";
			_markerName setMarkerAlphaLocal 0.5;
			_markerName setMarkerTextLocal "LOST GOLD";
		

_marker

