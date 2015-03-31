_triggerPositions = [[23127,15031,0],[23127,15031,0]];

//make triggers on server
if (isServer) then {
    0 = _triggerPositions spawn {
        waitUntil {time > 0};
        {
            _script = [_x, _forEachIndex] spawn {
                _tr = createTrigger ["EmptyDetector", _this select 0];
                _tr setVariable ["trID", _this select 1, true];
            };
            waitUntil {scriptDone _script};
        } forEach _this;
        triggersMade = true;
        publicVariable "triggersMade";
    };
};