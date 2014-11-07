/*
	File: fn_RoadCone.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates a RoadCone and preps it.
*/
private["_position","_RoadCone"];
_RoadCone = "RoadCone_F" createVehicle [0,0,0];
_RoadCone attachTo[player,[0,5.5,0]];
_RoadCone setDir 90;
_RoadCone setVariable["item","RoadConeDeployed",true];

life_action_RoadConeDeploy = player addAction[localize "STR_ISTR_RoadCone_Place",{if(!isNull life_RoadCone) then {detach life_RoadCone; life_RoadCone = ObjNull;}; player removeAction life_action_RoadConeDeploy; life_action_RoadConeDeploy = nil;},"",999,false,false,"",'!isNull life_RoadCone'];
life_RoadCone = _RoadCone;
waitUntil {isNull life_RoadCone};
if(!isNil "life_action_RoadConeDeploy") then {player removeAction life_action_RoadConeDeploy;};
if(isNull _RoadCone) exitWith {life_RoadCone = ObjNull;};
_RoadCone setPos [(getPos _RoadCone select 0),(getPos _RoadCone select 1),0];
_RoadCone setDamage 1;
life_action_RoadConePickup = player addAction[localize "STR_ISTR_RoadCone_Pack",life_fnc_packupRoadCone,"",0,false,false,"",
' _cones = nearestObjects[getPos player,["RoadCone_F"],8] select 0; !isNil "_cones" && !isNil {(_cones getVariable "item")}'];
[[_RoadCone],"TON_fnc_RoadCone",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.