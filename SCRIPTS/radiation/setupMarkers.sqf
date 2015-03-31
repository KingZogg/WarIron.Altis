_marker1Position = [23127,15031];


//Circle zone
			_markername = "RADZONE Fill";
			_marker = createMarker [_markername, _marker1Position];
			_markername setMarkerShape "ELLIPSE";
			_markername setMarkerColor "ColorRed";
			_markername setMarkerSize [6500, 13000];
			_markername setMarkerDir 32;
			_markername setMarkerBrush "BDiagonal";
			_markername setMarkerAlpha 0.7;


//Marker Name
			_markername2 = "RADZONE";
			_marker2 = createMarker [_markername2, _marker1Position];
			_markername2 setMarkerShape "ICON";
			_markername2 setMarkerType "KIA";
			_markername2 setMarkerColor "ColorRed";
			_markername2 setMarkerSize [1,1];
			_markername2 setMarkerText "RADIATION ZONE";				
			
		