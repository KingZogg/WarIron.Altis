////////////////////////////////////////////////////////////////////////
// SIMPLE - just pass number of rounds needed
// [3] execVM "mortar.sqf";
//
// OPTIONAL
// [NumRounds, AmmoType, Spread, TravelTime, Delay, ReloadTime, Side ] execVM "mortar.sqf";
//
// NumRounds    - Number of rounds to fire (number)             - 3
// AmmoType     - Config ammo name (string)                     - "Sh_120mm_HE"
// Spread       - Accuracy of each round (meters)               - 30
// TravelTime   - Delay between firing and splash (seconds)     - 10
// Delay        - Delay between each battery (seconds)          - 3
// ReloadTime   - Delay between fire missions (seconds)         - 10
// Side         - Side of artillary (east, west) etc            - west
//////////////////////////////////////////////////////////////////////

private ["_rounds", "_roundType", "_radiusSpread", "_travelTime", "_delay", "_reloadtime", "_side", "_HQ", "_position"];

_mortarPlayer =[_this,0] call BIS_fnc_param
_rounds = [_this,0,3,[0]] call BIS_fnc_param;
_roundType = [_this,1,"Sh_120mm_HE",[""]] call BIS_fnc_param;
_radiusSpread = [_this,2,30,[0]] call BIS_fnc_param;
_travelTime = [_this,3,10,[0]] call BIS_fnc_param;
_delay =  [_this,4,3,[0]] call BIS_fnc_param;
_reloadtime = [_this,5,10,[0]] call BIS_fnc_param;
_side = [_this,6,west,[sideUnknown]] call BIS_fnc_param;
_HQ = [_side,"HQ"];


sleep _delay;

    sleep 3;
    openMap false;

for "_round" from 1 to _rounds do {
       sleep _delay;
};

sleep _travelTime - 0.5;

_position = mortarPlayer;
for "_round" from 1 to _rounds do {
    _HQ sideChat format["Splash round %1",_round];
    sleep 0.5;
    _mortarPos = [(_position select 0)-_radiusSpread*sin(random 360),(_position select 1)-_radiusSpread*cos(random 360),200];
    _bomb = _roundType createVehicle _mortarPos;
    [_bomb, -90, 0] call BIS_fnc_setPitchBank;
    _bomb setVelocity [0,0,-100];
    sleep _delay - 0.5;
};

_HQ sideChat "FIRE MISSION COMPLETE.";
sleep _reloadtime;

_HQ sideChat "Artillary ready. Awaiting orders...";
deleteMarker "BOB_sms_artyPos";
BOB_sms_artyReady = nil;
publicVariable "BOB_sms_artyReady";