/*
	File: fn_TapeSign.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a TapeSign and preps it.
*/
private["_position","_TapeSign"];
_TapeSign = "TapeSign_F" createVehicle [0,0,0];
_TapeSign attachTo[player,[0,5.5,0]];
_TapeSign setDir 90;
_TapeSign setVariable["item","TapeSignDeployed",true];

life_action_TapeSignDeploy = player addAction[localize "STR_ISTR_TapeSign_Place",{if(!isNull life_TapeSign) then {detach life_TapeSign; life_TapeSign = ObjNull;}; player removeAction life_action_TapeSignDeploy; life_action_TapeSignDeploy = nil;},"",999,false,false,"",'!isNull life_TapeSign'];
life_TapeSign = _TapeSign;
waitUntil {isNull life_TapeSign};
if(!isNil "life_action_TapeSignDeploy") then {player removeAction life_action_TapeSignDeploy;};
if(isNull _TapeSign) exitWith {life_TapeSign = ObjNull;};
_TapeSign setPos [(getPos _TapeSign select 0),(getPos _TapeSign select 1),0];
_TapeSign setDamage 0;
_TapeSign allowDamage false;
life_action_TapeSignPickup = player addAction[localize "STR_ISTR_TapeSign_Pack",life_fnc_packupTapeSign,"",0,false,false,"",
' _tapesigns = nearestObjects[getPos player,["TapeSign_F"],8] select 0; !isNil "_tapesigns" && !isNil {(_tapesigns getVariable "item")}'];
[[_TapeSign],"TON_fnc_TapeSign",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.