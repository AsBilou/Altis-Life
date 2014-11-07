/*
	File: fn_PortableLight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a PortableLight and preps it.
*/
private["_position","_PortableLight"];
_PortableLight = "Land_PortableLight_double_F" createVehicle [0,0,0];
_PortableLight attachTo[player,[0,5.5,0]];
_PortableLight setDir 90;
_PortableLight setVariable["item","PortableLightDeployed",true];

life_action_PortableLightDeploy = player addAction[localize "STR_ISTR_PortableLight_Place",{if(!isNull life_PortableLight) then {detach life_PortableLight; life_PortableLight = ObjNull;}; player removeAction life_action_PortableLightDeploy; life_action_PortableLightDeploy = nil;},"",999,false,false,"",'!isNull life_PortableLight'];
life_PortableLight = _PortableLight;
waitUntil {isNull life_PortableLight};
if(!isNil "life_action_PortableLightDeploy") then {player removeAction life_action_PortableLightDeploy;};
if(isNull _PortableLight) exitWith {life_PortableLight = ObjNull;};
_PortableLight setPos [(getPos _PortableLight select 0),(getPos _PortableLight select 1),0];
_PortableLight setDamage 0;
_PortableLight allowDamage false;
life_action_PortableLightPickup = player addAction[localize "STR_ISTR_PortableLight_Pack",life_fnc_packupPortableLight,"",0,false,false,"",
' _ligthps = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0; !isNil "_ligthps" && !isNil {(_ligthps getVariable "item")}'];
[[_PortableLight],"TON_fnc_PortableLight",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.