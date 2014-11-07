/*
	File: fn_LightRed.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a LightRed and preps it.
*/
private["_position","_LightRed"];
_LightRed = "Land_Flush_Light_red_F" createVehicle [0,0,0];
_LightRed attachTo[player,[0,5.5,0]];
_LightRed setDir 90;
_LightRed setVariable["item","LightRedDeployed",true];

life_action_LightRedDeploy = player addAction[localize "STR_ISTR_LightRed_Place",{if(!isNull life_LightRed) then {detach life_LightRed; life_LightRed = ObjNull;}; player removeAction life_action_LightRedDeploy; life_action_LightRedDeploy = nil;},"",999,false,false,"",'!isNull life_LightRed'];
life_LightRed = _LightRed;
waitUntil {isNull life_LightRed};
if(!isNil "life_action_LightRedDeploy") then {player removeAction life_action_LightRedDeploy;};
if(isNull _LightRed) exitWith {life_LightRed = ObjNull;};
_LightRed setPos [(getPos _LightRed select 0),(getPos _LightRed select 1),0];
_LightRed setDamage 0;
_LightRed allowDamage false;
life_action_LightRedPickup = player addAction[localize "STR_ISTR_LightRed_Pack",life_fnc_packupLightRed,"",0,false,false,"",
' _ligthrs = nearestObjects[getPos player,["Land_Flush_Light_red_F"],8] select 0; !isNil "_ligthrs" && !isNil {(_ligthrs getVariable "item")}'];
[[_LightRed],"TON_fnc_LightRed",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.