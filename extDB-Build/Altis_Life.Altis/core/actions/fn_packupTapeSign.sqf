/*
	File: fn_packupTapeSign.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed TapeSign.
*/
private["_tapesigns"];
_tapesigns = nearestObjects[getPos player,["TapeSign_F"],8] select 0;
if(isNil "_tapesigns") exitWith {};

if(([true,"TapeSign",1] call life_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_TapeSign","PLAIN"];
	player removeAction life_action_TapeSignPickup;
	life_action_TapeSignPickup = nil;
	deleteVehicle _tapesigns;
};