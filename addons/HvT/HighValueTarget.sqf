//	@file Version: 1.0
//	@file Name: HighValueTarget.sqf
//	@file Author: Cael817, CRE4MPIE
//	@file Info:

// Edited by MeanY to include cheater detection

if (isDedicated) exitWith {};
waitUntil {!isNull player};

player addEventHandler ["AnimChanged", {
	if (isNil "createBountyMarker" && player getvariable "cmoney" > 4000001) then
	{		terminate createBountyMarker;
	
			_title  = "<t color='#ff0000' size='1.2' align='center'>HACKED MONEY AMOUNT DETECTED! </t><br />";
			_name = format ["%1<br /> ",name player];     
			_text = "<t color='#FFFFFF ' shadow='1' shadowColor='#000000' align='center'>Someone has spotted you cheating and marked your location on the map!</t><br />";     
			hint parsetext (_title +  _name +  _text); 
			playsound "Topic_Done";
		
			createBountyMarker = {
			_bountyMarker = createMarker ["bountyMarker", getPos (vehicle player)];
			_bountyMarker setMarkerShape "ICON";
			_bounty = player getvariable "cmoney";
			_bountyMarker setMarkerText (format ["HACKED Money Target: %1 ($%2)", name player, _bounty]);
			_bountyMarker setMarkerColor "ColorRed";
			_bountyMarker setMarkerType "mil_dot";
			sleep 5;
			deleteMarker "bountyMarker";
			createBountyMarker = nil;
								};
		[] spawn createBountyMarker;						
	};
}];

player addEventHandler ["AnimChanged", {
	if (isNil "createBountyMarker" && player getvariable "cmoney" > 250501) then
	{		terminate createBountyMarker;
			_title  = "<t color='#ff0000' size='1.2' align='center'>High value target detected! </t><br />";
			_name = format ["%1<br /> ",name player];     
			_text = "<t color='#FFFFFF ' shadow='1' shadowColor='#000000' align='center'>Someone has spotted you carrying a large sum of money and marked your location on the map!</t><br />";     
			hint parsetext (_title +  _name +  _text); 
			playsound "Topic_Done";
		
			createBountyMarker = {
			_bountyMarker = createMarker ["bountyMarker", getPos (vehicle player)];
			_bountyMarker setMarkerShape "ICON";
			_bounty = player getvariable "cmoney";
			_bountyMarker setMarkerText (format ["High Value Target: %1 ($%2)", name player, _bounty]);
			_bountyMarker setMarkerColor "ColorRed";
			_bountyMarker setMarkerType "mil_dot";
			sleep 60;
			deleteMarker "bountyMarker";
			createBountyMarker = nil;
								};
		[] spawn createBountyMarker;						
	};
}];
