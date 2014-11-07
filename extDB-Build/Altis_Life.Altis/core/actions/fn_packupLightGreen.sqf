/*
	File: fn_packupLightGreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed LightGreen.
*/
private["_ligths"];
_ligths = nearestObjects[getPos player,["Land_Flush_Light_green_F"],8] select 0;
if(isNil "_ligths") exitWith {};

if(([true,"LightGreen",1] call life_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_LightGreen","PLAIN"];
	player removeAction life_action_LightGreenPickup;
	life_action_LightGreenPickup = nil;
	deleteVehicle _ligths;
};