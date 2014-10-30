/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_4","Commico Central","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_1","Commico Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Commico Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_3","Commico Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_5","Commico Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		if(license_cop_air) then {
			_return pushBack ["cop_heliport","Heliport Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		};
		if(license_cop_cg) then {
			_return pushBack ["cop_boat","Port Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			_return pushBack ["CG","Guarde Côte","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		};
	};
	
	case civilian:
	{
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		if(license_civ_rebel) then {
			_return pushBack ["Rebelop","Camp Rebel 1","\a3\ui_f\data\map\MapControl\bunker_ca.paa"];
			_return pushBack ["Rebelop_1","Camp Rebel 2","\a3\ui_f\data\map\MapControl\bunker_ca.paa"];
			_return pushBack ["Rebelop_2","Camp Rebel 3","\a3\ui_f\data\map\MapControl\bunker_ca.paa"];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Hospital Kavala","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Hospital Athira","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Hospital Pygros","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;