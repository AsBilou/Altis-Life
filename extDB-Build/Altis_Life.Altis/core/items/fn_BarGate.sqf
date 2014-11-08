/*
	File: fn_BarGate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a BarGate and preps it.
*/
private["_position","_BarGate"];
_BarGate = "Land_BarGate_F" createVehicle [0,0,0];
_BarGate attachTo[player,[0,5.5,4]];
_BarGate setDir 90;
_BarGate setVariable["item","BarGateDeployed",true];

life_action_BarGateDeploy = player addAction[localize "STR_ISTR_BarGate_Place",{if(!isNull life_BarGate) then {detach life_BarGate; life_BarGate = ObjNull;}; player removeAction life_action_BarGateDeploy; life_action_BarGateDeploy = nil;},"",999,false,false,"",'!isNull life_BarGate'];
life_BarGate = _BarGate;
waitUntil {isNull life_BarGate};
if(!isNil "life_action_BarGateDeploy") then {player removeAction life_action_BarGateDeploy;};
if(isNull _BarGate) exitWith {life_BarGate = ObjNull;};
_BarGate setPos [(getPos _BarGate select 0),(getPos _BarGate select 1),0];
_BarGate setDamage 0;
_BarGate allowDamage false;
life_action_BarGatePickup = player addAction[localize "STR_ISTR_BarGate_Pack",life_fnc_packupBarGate,"",0,false,false,"",
' _bargates = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0; !isNil "_bargates" && !isNil {(_bargates getVariable "item")}'];
[[_BarGate],"TON_fnc_BarGate",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.