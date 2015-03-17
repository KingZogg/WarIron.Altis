if (!isDedicated) then {
	waitUntil { alive player && time > 0 && !isnull (finddisplay 46)};	
	
_onScreenTime = 7;
 
_role1 = "WELCOME"; //In Red
_role1names = [profileName]; //In Grey
_role2 = "ADMINS:";
_role2names = ["We are always watching :-)"];
_role3 = "READ THE BRIEFING !:";
_role3names = ["There is a lot of custom stuff here.","All info on custom mods etc","What we are adding in.","How long vehicles save for etc.","What the teamspeak address is etc etc."];
_role4 = "THE LIST OF NO'S";
_role4names = ["No Glitching","No Hacking","No Base Griefing","No Excessive Swearing","No Talking In Radio Chat","No Racism","Generally Don't be a dick"];
_role5 = "ENJOY";
_role5names = ["Now bugger off and kill someone."]; 
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
[safezoneX + safezoneW - 0.5,0.35], //DEFAULT: 0.5,0.35
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
[_role5, _role5names]
];

};