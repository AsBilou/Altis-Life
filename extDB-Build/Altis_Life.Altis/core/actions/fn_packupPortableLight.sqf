/*
	File: fn_packupPortableLight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed PortableLight.
*/
private["_ligthps"];
_ligthps = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0;
if(isNil "_ligthps") exitWith {};

if(([true,"PortableLight",1] call life_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_PortableLight","PLAIN"];
	player removeAction life_action_PortableLightPickup;
	life_action_PortableLightPickup = nil;
	deleteVehicle _ligthps;
};