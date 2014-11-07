/*
	File: fn_LightGreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a LightGreen and preps it.
*/
private["_position","_LightGreen"];
_LightGreen = "Land_Flush_Light_green_F" createVehicle [0,0,0];
_LightGreen attachTo[player,[0,5.5,0]];
_LightGreen setDir 90;
_LightGreen setVariable["item","LightGreenDeployed",true];

life_action_LightGreenDeploy = player addAction[localize "STR_ISTR_LightGreen_Place",{if(!isNull life_LightGreen) then {detach life_LightGreen; life_LightGreen = ObjNull;}; player removeAction life_action_LightGreenDeploy; life_action_LightGreenDeploy = nil;},"",999,false,false,"",'!isNull life_LightGreen'];
life_LightGreen = _LightGreen;
waitUntil {isNull life_LightGreen};
if(!isNil "life_action_LightGreenDeploy") then {player removeAction life_action_LightGreenDeploy;};
if(isNull _LightGreen) exitWith {life_LightGreen = ObjNull;};
_LightGreen setPos [(getPos _LightGreen select 0),(getPos _LightGreen select 1),0];
_LightGreen setDamage 0;
_LightGreen allowDamage false;
life_action_LightGreenPickup = player addAction[localize "STR_ISTR_LightGreen_Pack",life_fnc_packupLightGreen,"",0,false,false,"",
' _ligths = nearestObjects[getPos player,["Land_Flush_Light_green_F"],8] select 0; !isNil "_ligths" && !isNil {(_ligths getVariable "item")}'];
[[_LightGreen],"TON_fnc_RoadCone",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.