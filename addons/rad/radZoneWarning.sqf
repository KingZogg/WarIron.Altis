_t = _this select 0;
		
	waitUntil 
	{
		if(!alive player) exitwith {
		terminate radZone;
	    terminate radZoneWarning;
	    hint "";
		};
		
		hintsilent parseText "<t color='#fff400' size='2.0' shadow='1' shadowColor='#000000' align='center'>RADIATION ZONE DETECTED</t>";
		playsound "RadZoneS";
		_damageUnits= getDammage player;
		player setdamage (_damageUnits + 0.005);
		sleep 1;
		_t = _t - 1;
		
	_t == 0
	};