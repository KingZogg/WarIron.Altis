sleep 30;
	
_text = "
<t align='center'><t shadow= 1 shadowColor='#000000'><t size='1.2'><t color='#FF9966'>WarIron.Com Live Stats and Forum.</t></t>
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>The WarIron Clan is now recruiting. Details on the forum.</t><br /> 
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Bought and Mission vehicles automatically save between restarts.</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Base objects, Vehicles and Crates will save for 7 days.</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Base object doors can be locked/unlocked with a keypad.</t><br />
<br />
<t align='center'><t shadow= 1 shadowColor='#000000'>Clans can upload their own uniforms. Use the forum @ wariron.com</t><br />
<br />
";

hint parseText format ["<t align='center'>Welcome %2</t><br />%1",_text, name player];
 