/*
	File: fn_packupLightRed.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed LightRed.
*/
private["_ligthrs"];
_ligthrs = nearestObjects[getPos player,["Land_Flush_Light_red_F"],8] select 0;
if(isNil "_ligthrs") exitWith {};

if(([true,"LightRed",1] call life_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_LightRed","PLAIN"];
	player removeAction life_action_LightRedPickup;
	life_action_LightRedPickup = nil;
	deleteVehicle _ligthrs;
};