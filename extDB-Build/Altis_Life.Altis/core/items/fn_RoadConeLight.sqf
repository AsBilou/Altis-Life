/*
	File: fn_RoadConeLight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a RoadConeLight and preps it.
*/
private["_position","_RoadConeLight"];
_RoadConeLight = "RoadCone_L_F" createVehicle [0,0,0];
_RoadConeLight attachTo[player,[0,5.5,0]];
_RoadConeLight setDir 90;
_RoadConeLight setVariable["item","RoadConeLightDeployed",true];

life_action_RoadConeLightDeploy = player addAction[localize "STR_ISTR_RoadConeLight_Place",{if(!isNull life_RoadConeLight) then {detach life_RoadConeLight; life_RoadConeLight = ObjNull;}; player removeAction life_action_RoadConeLightDeploy; life_action_RoadConeLightDeploy = nil;},"",999,false,false,"",'!isNull life_RoadConeLight'];
life_RoadConeLight = _RoadConeLight;
waitUntil {isNull life_RoadConeLight};
if(!isNil "life_action_RoadConeLightDeploy") then {player removeAction life_action_RoadConeLightDeploy;};
if(isNull _RoadConeLight) exitWith {life_RoadConeLight = ObjNull;};
_RoadConeLight setPos [(getPos _RoadConeLight select 0),(getPos _RoadConeLight select 1),0];
_RoadConeLight setDamage 0;
_RoadConeLight allowDamage false;
life_action_RoadConeLightPickup = player addAction[localize "STR_ISTR_RoadConeLight_Pack",life_fnc_packupRoadConeLight,"",0,false,false,"",
' _conesl = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_conesl" && !isNil {(_conesl getVariable "item")}'];
[[_RoadConeLight],"TON_fnc_RoadConeLight",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.