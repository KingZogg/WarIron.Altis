_marker1Position = [23127,15031];
_marker2Position = [17546,12603];
_marker3Position = [18533,13464];
//_marker3Position = [19990,18129];
//_marker4Position = [17546,12603];
//_marker5Position = [18091,8921];
_marker6Position = [9642,8199];
	

//Circle zone
			_markername = "RADZONE Fill";
			_marker = createMarker [_markername, _marker1Position];
			_markername setMarkerShape "ELLIPSE";
			_markername setMarkerColor "ColorRed";
			_markername setMarkerSize [6500, 13000];
			_markername setMarkerDir 32;
			_markername setMarkerBrush "BDiagonal";
			_markername setMarkerAlpha 0.55;

			//Circle zone
			_markername = "RADZONE Fill 2";
			_marker = createMarker [_markername, _marker1Position];
			_markername setMarkerShape "ELLIPSE";
			_markername setMarkerColor "ColorYellow";
			_markername setMarkerSize [6600, 13100];
			_markername setMarkerDir 32;
			_markername setMarkerBrush "FDiagonal";
			_markername setMarkerAlpha 0.55;
			
			

//Marker Name
			_markername2 = "RADZONE";
			_marker2 = createMarker [_markername2, _marker1Position];
			_markername2 setMarkerShape "ICON";
			_markername2 setMarkerType "KIA";
			_markername2 setMarkerColor "ColorRed";
			_markername2 setMarkerSize [1,1];
			_markername2 setMarkerText "RADIATION ZONE";	

//OPFOR Marker Name
			_markername7 = "Opfor Controlled";
			_marker7 = createMarker [_markername7, _marker6Position];
			_markername7 setMarkerShape "ICON";
			_markername7 setMarkerType "KIA";
			_markername7 setMarkerColor "ColorRed";
			//_markername3 setMarkerSize [1,1];
			_markername7 setMarkerText " AREA IS OPFOR CONTROLLED";
			

//Fly Zone Marker Name
			_markername3 = "OK1";
			_marker3 = createMarker [_markername3, _marker2Position];
			_markername3 setMarkerShape "ICON";
			_markername3 setMarkerType "c_plane";
			_markername3 setMarkerColor "ColorGreen";
			//_markername3 setMarkerSize [1,1];
			_markername3 setMarkerText "IT'S SAFE TO FLY IN THE RADIATION ZONE";
/*
			
			//Marker Name
			_markername4 = "OK2";
			_marker4 = createMarker [_markername4, _marker3Position];
			_markername4 setMarkerShape "ICON";
			_markername4 setMarkerType "c_plane";
			_markername4 setMarkerColor "ColorRed";
			//_markername3 setMarkerSize [1,1];
			_markername4 setMarkerText "OK TO FLY HERE";
			
			//Marker Name
			_markername5 = "OK3";
			_marker5 = createMarker [_markername5, _marker4Position];
			_markername5 setMarkerShape "ICON";
			_markername5 setMarkerType "c_plane";
			_markername5 setMarkerColor "ColorRed";
			//_markername3 setMarkerSize [1,1];
			_markername5 setMarkerText "OK TO FLY HERE";
			
			//Marker Name
			_markername6 = "OK4";
			_marker6 = createMarker [_markername6, _marker5Position];
			_markername6 setMarkerShape "ICON";
			_markername6 setMarkerType "c_plane";
			_markername6 setMarkerColor "ColorRed";
			//_markername3 setMarkerSize [1,1];
			_markername6 setMarkerText "OK TO FLY HERE";

			
	
			
			
			
/*			
			
			class Item179
		{
			position[]={10797.302,16.799921,10418.44};
			name="G1";
			markerType="RECTANGLE";
			type="Empty";
			a=250;
			b=80;
		};			position[]={9932.0283,11.977015,9635.6621};
			name="G2";
			markerType="ELLIPSE";
			type="Empty";
			a=200;
			b=200;
		class Item180
		{position[]={10708.076,38.541519,9425.8115};
			name="G3";
			markerType="ELLIPSE";
			type="Empty";
			a=500;
			b=500;
			
			
	
			position[]={11368.927,11.036054,9848.6777};
			name="G4";
			markerType="ELLIPSE";
			type="Empty";
			a=150;
			b=150;
		};
		class Item186
		{
			position[]={9691.4326,15.057489,8740.7305};
			name="G5";
			markerType="ELLIPSE";
			type="Empty";
			a=150;
			b=150;
		};
			position[]={9882.3906,128.32086,6951.6509};
			name="G6";
			markerType="ELLIPSE";
			type="Empty";
			a=300;
			b=300;
		{
				position[]={10984.363,132.29401,6742.3755};
			name="G7";
			markerType="ELLIPSE";
			type="Empty";
			a=300;
			b=300;
		};
		class Item213
		{
			position[]={13164.456,59.241367,6809.9448};
			name="G8";
			markerType="ELLIPSE";
			type="Empty";
			a=300;
			b=300;
		};
		
		};
		
		{
			position[]={10341.323,67.254311,8698.0332};
			name="T1";
			markerType="ELLIPSE";
			type="Empty";
			a=200;
			b=200;
		};
		class Item188
		{
			position[]={11213.415,182.41,8703.8916};
			name="T2";
			markerType="ELLIPSE";
			type="Empty";
			a=200;
			b=200;
		{
			position[]={9134.0664,86.534615,8382.9912};
			name="T3";
			markerType="ELLIPSE";
			type="Empty";
			a=200;
			b=200;
		};
		class Item198
		{
			position[]={9934.8789,120.06219,7875.2642};
			name="T4";
			markerType="ELLIPSE";
			type="Empty";
			a=200;
			b=200;
		{
			position[]={10793.859,234.0098,7626.583};
			name="T5";
			markerType="ELLIPSE";
			type="Empty";
			a=200;
			b=200;
		};
		class Item195
		{
			position[]={11709,248.70053,7601.1074};
			name="T6";
			markerType="ELLIPSE";
			type="Empty";
			a=200;
			b=200;
		};
		class Item196
		{
			position[]={12236.136,210.86029,7436.501};
			name="T7";
			markerType="ELLIPSE";
			type="Empty";
			a=200;
			b=200;
		};
		class Item197
		{
			position[]={12680.969,160.40637,6977.9502};
			name="T8";
			markerType="ELLIPSE";
			type="Empty";
			a=200;
			b=200;
		};
		
		};
		class Item189
		{
			position[]={11541.031,19.754549,9421.9609};
			name="H1";
			markerType="ELLIPSE";
			type="Empty";
			a=60;
			b=60;
		};
		class Item200
		{
			position[]={12150.571,26.836428,8438.7686};
			name="H2";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		{
			position[]={9240.499,41.78809,8061.3979};
			name="H3";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		};
		class Item191
		{
			position[]={8936.7285,62.217945,7542.9868};
			name="H4";
			markerType="ELLIPSE";
			type="Empty";
			a=80;
			b=80;
		};
		class Item192
		{
			position[]={11533.695,79.713036,7067.5986};
			name="H5";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		};
		
		};
		class Item201
		{
			position[]={13206.166,13.369912,7459.2666};
			name="H6";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		};
		class Item202
		{
			position[]={10267.294,123.91959,7554.6733};
			name="H7";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		};
		class Item211
		{
			position[]={11923.326,15.336156,9725.4219};
			name="H8";
			markerType="ELLIPSE";
			type="Empty";
			a=60;
			b=60;
		{
		
		};
	position[]={14295.042,4.9321656,13035.541};
			name="S1";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		{
			position[]={14207.388,73.789391,21204.658};
			name="S2";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		};
		class Item205
		{
			position[]={13801.065,20.251879,18951.439};
			name="S3";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		};
		class Item206
		{
			position[]={8383.498,180.15833,18243.818};
			name="S5";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		};
		class Item207
		{
			position[]={3897.0742,49.95454,12294.313};
			name="S4";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		};
		class Item208
		{
			position[]={8301.1738,76.301369,10074.475};
			name="S6";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;
		};
		position[]={12297.842,123.97325,8886.0557};
			name="M1";
			markerType="ELLIPSE";
			type="Empty";
			a=100;
			b=100;