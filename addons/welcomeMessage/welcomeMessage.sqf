sleep 40;
	
_text = "
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'><t size='1.2'><t color='#FF9966'>To</t></t>
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'><t size='1.2'><t color='#FF9966'>WarIron.Com</t></t>
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'><t size='1.2'><t color='#FF9966'>TeamSpeak ts3.wariron.com</t></t>
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'><t size='1.2'><t color='#FF9966'>Live Stats @ WarIron.Com</t></t>
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>The WarIron Clan is now recruiting. Details on the forum.</t><br /> 
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Bought and Mission vehicles automatically save between restarts.</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Base objects, Vehicles and Crates will save for 7 days.</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Bought base object doors can be locked/unlocked with a keypad.</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Clans can upload their own uniforms. Use the forum @ wariron.com</t><br />
<br />
";

hint parseText format ["<t color='#FF0000' align='center'>Welcome %2</t><br />%1",_text, name player];
 