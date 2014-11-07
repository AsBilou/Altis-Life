/*
	File: fn_packupRoadCone.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed Road Cone.
*/
private["_cones"];
_cones = nearestObjects[getPos player,["RoadCone_F"],8] select 0;
if(isNil "_cones") exitWith {};

if(([true,"roadcone",1] call life_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_RoadCone","PLAIN"];
	player removeAction life_action_RoadConePickup;
	life_action_RoadConePickup = nil;
	deleteVehicle _cones;
};