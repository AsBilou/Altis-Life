#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["demian2435_police_man_uniform",nil,25];
		_ret pushBack ["bilou_uni_PR",nil,25];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["bilou_uni_PA",nil,25];
			if(__GETC__(life_coplevel) > 2) then
			{
				_ret pushBack ["bilou_uni_PC",nil,25];
				if(__GETC__(life_coplevel) > 3) then
				{
					_ret pushBack ["bilou_uni_PS",nil,25];
					if(__GETC__(life_coplevel) > 4) then
					{
						_ret pushBack ["bilou_uni_PSC",nil,25];
						if(__GETC__(life_coplevel) > 5) then
						{
							_ret pushBack ["bilou_uni_PM",nil,25];
							if(__GETC__(life_coplevel) > 6) then
							{
								_ret pushBack ["bilou_uni_PL",nil,25];
								_ret pushBack ["rpima_uniform",nil,25];
								if(__GETC__(life_coplevel) > 7) then
								{
									_ret pushBack ["bilou_uni_PCa",nil,25];
									if(__GETC__(life_coplevel) > 8) then
									{
										_ret pushBack ["bilou_uni_PCom",nil,25];
										if(__GETC__(life_coplevel) > 9) then
										{
											_ret pushBack ["bilou_uni_PCP",nil,25];
										};
									};
								};
							};
						};
					};
				};
			};
		};
		_ret pushBack ["U_B_Wetsuit",nil,25];
		_ret pushBack ["U_C_Scientist",nil,25];
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["police_cap",nil,75];
			_ret pushBack ["max_biker_helmet",nil,120];
			if(__GETC__(life_coplevel) > 3) then
			{
				_ret pushBack ["H_Beret_blk_POLICE",nil,100];
				if(__GETC__(life_coplevel) > 6) then
				{
					_ret pushBack ["RPIMA_helm",nil,100];
					_ret pushBack ["RPIMA_helm_close",nil,100];
				};
			};
		};
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
			["G_Combat",nil,55],
			["NeckTight_Red",nil,30],
			["NeckTight",nil,30],
			["NeckTight_OD",nil,30],
			["NeckTight_Dmaripat",nil,30],
			["NeckTight_Tan",nil,30],
			["NeckTight_Gry",nil,30],
			["L_Shemagh_Red",nil,30],
			["L_Shemagh_Tan",nil,30],
			["L_Shemagh_OD",nil,30],
			["L_Shemagh_Gry",nil,30],
			["L_shemagh_white",nil,30],
			["Balaclava_Black",nil,30]
		];
		if(__GETC__(life_coplevel) > 6) then
				{
					_ret pushBack ["rpima_goggle_black",nil,100];
				};
		_ret pushBack ["G_B_Diving",nil,100];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["demian2435_police_belt",nil,800];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["V_BandollierB_blk",nil,800];
			if(__GETC__(life_coplevel) > 3) then
			{
				_ret pushBack ["demian2435_police_vest",nil,1500];
				if(__GETC__(life_coplevel) > 6) then
				{
					_ret pushBack ["rpima_BlackVest",nil,1500];
					_ret pushBack ["RPIMA_vest_black2",nil,1500];
				};
			};
		};
		_ret pushBack ["V_RebreatherB",nil,800];
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_blk",nil,500],
			["B_AssaultPack_blk",nil,700],
			["B_TacticalPack_blk",nil,2500],
			["B_Carryall_cbr",nil,3500]
		];
		if(__GETC__(life_coplevel) > 9) then
		{
			_ret pushBack ["B_UAV_01_backpack_F",nil,4000];
		};
	};
};

_ret;