if (!isDedicated) then {
	waitUntil { alive player && time > 0 && !isnull (finddisplay 46)};	
	
_onScreenTime = 7;
 
_role1 = "HELLO"; //In Red
_role1names = ["Got Clean Undies on ?"]; //In Grey
//_role2 = "YOU STILL READING THIS ?";
//_role2names = ["I am lining you up now !"];
//_role3 = "SHIFT F4 NOW IF YOU'RE A LAZY SOD:";
//_role3names = ["It will save you much pain.","You need to work here."];
_role4 = "READ THE BRIEFING LUKE !:";
_role4names = ["This is where the big boys","get the big toys","Puleeze read the briefing"];
_role5 = "THE LIST OF NO'S";
_role5names = ["No Glitching","No Hacking","No Base Griefing","No Excessive Swearing","No Talking In Radio Chat","No Racism","No, you can't be a dick"];
//_role6 = "STILL HERE ? GOOD.";
//_role6names = ["Bugger off and kill someone.","Take all his toys","Make him cry."]; 
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
//[_role2, _role2names],
//[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names]
//[_role6, _role6names]
];

};