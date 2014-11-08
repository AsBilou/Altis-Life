#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop","_weapons","_tools"];
_weapons = [];
_tools = [];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				_tools = [
						["Binocular",nil,150],
						["Rangefinder",nil,150],
						["ItemWatch",nil,100],
						["ItemRadio",nil,100],
						["ItemCompass",nil,100],
						["ItemMap",nil,100],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150]
					];
				if(__GETC__(life_coplevel) > 2) then //Caporal
				{	
					_tools pushBack ["Medikit",nil,1000];
					_tools pushBack ["NVGoggles_OPFOR",nil,2000];
				};
				["Altis Cop Shop",_tools];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles_INDEP",nil,1200],
						["B_FieldPack_ocamo",nil,3000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				_weapons = [
								["arifle_sdar_F","Taser Rifle",2000],
								["20Rnd_556x45_UW_mag","Taser Rifle Magazine",250],
								["hgun_P07_snds_F","Stun Pistol",2000],
								["hgun_P07_F",nil,2000],
								["16Rnd_9x21_Mag",nil,50],
								["muzzle_snds_L",nil,500]
							];
				if(__GETC__(life_coplevel) > 1) then //Agent
				{
					_weapons pushBack ["SMG_02_F",nil,650];
					_weapons pushBack ["30Rnd_9x21_Mag",nil,650];
					if(__GETC__(life_coplevel) > 2) then //Caporal
					{
						_weapons pushBack ["optic_ACO_grn",nil,500];
						if(__GETC__(life_coplevel) > 3) then //Sergent
						{
							_weapons pushBack ["SMA_Mk16_black",nil,2000];
							_weapons pushBack ["SMA_30Rnd_556x45_M855A1",nil,500];
							_weapons pushBack ["optic_Holosight",nil,500];
							_weapons pushBack ["acc_flashlight",nil,500];
							_weapons pushBack ["acc_pointer_IR",nil,500];
							if(__GETC__(life_coplevel) > 4) then //Sergent Chef
							{
								_weapons pushBack ["SMA_HK416vfg",nil,2000];
								if(__GETC__(life_coplevel) > 5) then //Major
								{
									_weapons pushBack ["arifle_MXC_Black_F",nil,2000];
									_weapons pushBack ["optic_Arco",nil,500];
									_weapons pushBack ["optic_Hamr",nil,500];
									_weapons pushBack ["30Rnd_65x39_caseless_mag",nil,500];
									if(__GETC__(life_coplevel) > 6) then //Lieutenant
									{
										_weapons pushBack ["SMA_Mk17_black",nil,2000];
										_weapons pushBack ["20Rnd_762x51_Mag",nil,500];
										_weapons pushBack ["SMA_HK417vfg",nil,2000];
										if(__GETC__(life_coplevel) > 7) then //Capitaine
										{	
											_weapons pushBack ["SMA_SKS_F",nil,2000];
											_weapons pushBack ["SMA_30Rnd_762x39_SKS",nil,500];
											_weapons pushBack ["SMA_HK417_16in_afg",nil,2000];
										};
									};
								};
							};
						};
					};
				};
				["Armurerie",_weapons];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"You are not at a sergeant rank!"};
			default
			{
				/*["Altis Sergeant Officer Shop",
					[
						["SMG_02_ACO_F",nil,15000],
						["hgun_ACPC2_F",nil,17500],
						["HandGrenade_Stone","Flashbang",1700],
						["arifle_MXC_F",nil,30000],
						["optic_Arco",nil,2500],
						["muzzle_snds_H",nil,2750],
						["30Rnd_65x39_caseless_mag",nil,100],
						["30Rnd_9x21_Mag",nil,60],
						["9Rnd_45ACP_Mag",nil,200],
						["HandGrenade_Stone","Flashbang",1700]
					]
				];
				*/
				["Altis Millitary Shop",
					[
						["hgun_P07_snds_F","Stun Pistol",1000],
						["16Rnd_9x21_Mag",nil,50]
						//["hlc_smg_mp5k_PDW",nil,1500],
						//["hlc_30Rnd_9x19_B_MP5",nil,250]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_TRG20_F",nil,25000],
						["arifle_Mk20_F",nil,30000],
						["arifle_Mk20_GL_F",nil,35000],
						["arifle_Katiba_F",nil,40000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_556x45_Stanag",nil,300],
						["30Rnd_65x39_caseless_green",nil,275],
						["UGL_FlareWhite_F",nil,1000],
						["1Rnd_Smoke_Grenade_shell",nil,1000]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],				//Rook-40 9 mm
						["hgun_Pistol_heavy_02_F",nil,9850],	//Zubr .45
						["hgun_Pistol_heavy_01_F",nil,10000],	//4-five .45
						["hgun_ACPC2_F",nil,11500],				//ACP-C2 .45
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["11Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["hgun_Pistol_Signal_F",nil,1000],
						["6Rnd_GreenSignal_F",nil,20],
						["6Rnd_RedSignal_F",nil,20]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],						//Rook-40 9 mm
						["hgun_P07_F",nil,7500],						//P07 9 mm
						["hgun_Pistol_heavy_02_F",nil,2500], 			//Zubr .45
						["hgun_ACPC2_F",nil,4500],			 			//ACP-C2 .45
						["hgun_PDW2000_F",nil,9500],					//PDW2000 9 mm
						["optic_ACO_grn_smg","Viseur PDW/Vermin",950],	//PDW2000
						["SMG_01_F",nil,12000],							//Vermin SMG .45 ACP
						["AG_MP9_sidearm",nil,12000],					//MP9 Sidearm
						["30Rnd_45ACP_Mag_SMG_01",nil,1200],			//Vermin SMG .45 ACP
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};
