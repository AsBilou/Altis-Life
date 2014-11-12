#include <macro.h>
/*
	File: fn_clothing_medic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Medic clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Medical Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["bilou_uni_Med",nil,25];
		_ret pushBack ["U_B_Wetsuit",nil,25];
		_ret pushBack ["U_C_Scientist",nil,25];
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["Backwards_hat",nil,75];
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_B_Diving",nil,100]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = [];
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_TacticalPack_blk",nil,2500]
		];
	};
};

_ret;