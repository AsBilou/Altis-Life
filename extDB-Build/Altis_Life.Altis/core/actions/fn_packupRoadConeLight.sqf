/*
	File: fn_packupRoadConeLight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed RoadConeLight.
*/
private["_conesl"];
_conesl = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_conesl") exitWith {};

if(([true,"RoadConeLight",1] call life_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_RoadConeLight","PLAIN"];
	player removeAction life_action_RoadConeLightPickup;
	life_action_RoadConeLightPickup = nil;
	deleteVehicle _conesl;
};