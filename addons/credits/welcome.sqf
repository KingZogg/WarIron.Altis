if (!isDedicated) then {
	waitUntil { alive player && time > 0 && !isnull (finddisplay 46)};	
	
_onScreenTime = 7;
 
_role1 = "WELCOME"; //In Red
_role1names = [profileName]; //In Grey
_role2 = "ADMINS:";
_role2names = ["We are watching :-)"];
_role3 = "SERVER INFO:";
_role3names = ["B-ZERK.COM EPOCH"];
_role4 = "SERVER SECURITY<br />by";
_role4names = ["infiSTAR.de", "Wastelands"];
_role5 = "SERVER MODS";
_role5names = ["Custom map", "Custom mods"];
_role6 = "WEBSITE";
_role6names = ["Visit Us At","B-ZERK.COM"];
_role7 = "TEAMSPEAK 3";
_role7names = ["Join us on TS","TS3BZERK.COM","Private Channels Available"];
_role8 = "DONATIONS";
_role8names = ["We do Accept Donations","See the Website for Details"," All Donations Received help to","keep the Servers","and Teamspeak Online."];
_role9 = "RULES";
_role9names = ["No Glitching","No Hacking","No Base Griefing","No Excessive Swearing","No Talking In Radio Chat","No Racism"];
_role10 = "ENJOY";
_role10names = ["ENJOY"]; 
{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.60' color='#B70009' align='center'>%1<br /></t>", _memberFunction]; //Changes colours
_finalText = _finalText + "<t size='0.60' color='#808080' align='center'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names],
[_role9, _role9names],
[_role10, _role10names]
];

};