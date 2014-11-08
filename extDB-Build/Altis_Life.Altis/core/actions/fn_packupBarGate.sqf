/*
	File: fn_packupBarGate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed BarGate.
*/
private["_bargates"];
_bargates = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0;
if(isNil "_bargates") exitWith {};

if(([true,"BarGate",1] call life_fnc_handleInv)) then
{
	titleText[localize "STR_NOTF_BarGate","PLAIN"];
	player removeAction life_action_BarGatePickup;
	life_action_BarGatePickup = nil;
	deleteVehicle _bargates;
};