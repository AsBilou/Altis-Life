#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",10000],
			["b_offroad_medic",10000],
			["b_suv_medic",15000],
			["b_suv_medic_grey",15000],
			["DAR_TahoeEMS",20000],
			["I_Truck_02_medical_F",25000],
			["O_Truck_03_medical_F",45000],
			["B_Truck_01_medical_F",60000]
		];
	};
	
	case "med_air_hs": {
		_return = [
			["b_heli_medic",50000],
			["RSPack_1d",75000],
			["b_orca_medic",75000],
			["EMD_CH49_Mohawk_FG",100000]
		];
	};
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["emu_offroad_g1",12500],
			["C_SUV_01_F",35000],
			["Jonzie_96_Impala",40000],
			["DAR_ImpalaCiv",45000],
			["DAR_ImpalaCivA",45000],
			["DAR_TaurusCiv",50000],
			["DAR_TaurusCivBlue",50000],
			["DAR_TaurusCivBlack",50000],
			["C_Van_01_transport_F",50000],
			["DAR_FusionCiv",55000],
			["DAR_FusionCivBlue",55000],
			["DAR_FusionCivRed",55000],
			["DAR_FusionCivBlack",55000],
			["DAR_TahoeCiv",60000],
			["DAR_TahoeCivRed",60000],
			["DAR_TahoeCivBlue",60000],
			["DAR_TahoeCivSilver",60000],
			["DAR_ChargerCiv",65000],
			["DAR_Charger_Blue",65000],
			["SAL_AudiCiv",70000],
			["SAL_AudiCivRed",70000],
			["SAL_AudiCivSilver",70000],
			["SAL_AudiCivBlack",70000],
			["DAR_ChallengerCivWhite",75000],
			["DAR_ChallengerCivRed",75000],
			["DAR_ChallengerCivBlack",75000],
			["DAR_ChallengerCivOrange",75000]
		];
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",275000],
			["O_Truck_03_transport_F",200000],
			["O_Truck_03_covered_F",250000],
			["B_Truck_01_box_F",350000],
			["O_Truck_03_device_F",450000]
		];	
	};
	
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["emu_offroad_digi1",15000],
			["emu_offroad_digi_dark",15000],
			["emu_offroad_digi_dark2",15000],
			["emu_offroad_t1",15000],
			["max_robbers_Hatchback",30000],
			["max_robbers_suv",50000],
			["O_MRAP_02_F",150000],
			["B_Heli_Light_01_F",325000],
			["EMU_MH9",325000],
			["EMU_MH9_camo",325000],
			["EMU_MH9_yel",325000]
		];
		
		if(license_civ_rebel) then
		{
			_return pushBack
			["B_G_Offroad_01_armed_F",750000];
		};
	};
	
	case "cop_car":
	{
		//Recrue
		_return pushBack
		["max_Police_Quadbike",1000];
		_return pushBack
		["demian2435_police_offroad",5000];
		_return pushBack
		["DAR_ImpalaPolice",5000];
		
		//Agent
		if(__GETC__(life_coplevel) > 1) then
		{
			_return pushBack
			["max_prison_van",5000];
			_return pushBack
			["DAR_TaurusPolice",5000];
			
			//Caporal
			if(__GETC__(life_coplevel) > 2) then
			{
				_return pushBack
				["demian2435_police_car",5000];
				_return pushBack
				["DAR_TahoePolice",5000];
				
				//Sergent
				if(__GETC__(life_coplevel) > 3) then
				{
					_return pushBack
					["Max_Suv_undercover",5000];
					_return pushBack
					["DAR_ChargerPolice",5000];
					_return pushBack
					["DAR_ImpalaPoliceSlick",5000];
					_return pushBack
					["max_Hatchback_undercover",5000];
					_return pushBack
					["B_MRAP_01_F",5000];
					_return pushBack
					["DAR_TahoePoliceSlick",5000];
					
					//Lieutenant
					if(__GETC__(life_coplevel) > 4) then
					{	
						_return pushBack
						["DAR_ExplorerPolice",5000];
						_return pushBack
						["DAR_TahoePoliceDet",5000];
						_return pushBack
						["DAR_CVPISlick",5000];
						
						//Capitaine
						if(__GETC__(life_coplevel) > 5) then
						{
							_return pushBack
							["DAR_ChargerPoliceStateSlick",5000];
							_return pushBack
							["demian2435_swat_offroad",5000];
							
							//Major
							if(__GETC__(life_coplevel) > 6) then
							{
								_return pushBack
								["DAR_ImpalaPoliceDet",5000];
								_return pushBack
								["Jonzie_96_Impala_Unmarked",5000];
								//Colonel
								if(__GETC__(life_coplevel) > 7) then
								{
									_return pushBack
									["B_MRAP_01_hmg_F",5000];
								};
							};
						};
					};
				};
			};
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",253000],
			["EMU_MH9_des",253000],
			["EMU_MH9_navy",253000],
			["EMU_MH9_wh",253000],
			["EMU_MH9_blk",253000],
			["O_Heli_Light_02_unarmed_F",750000],
			["Mohawk_civ1_FG",1000000]
		];
	};
	
	case "cop_air":
	{
		
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack
			["B_Heli_Light_01_F",75000];
			if(__GETC__(life_coplevel) > 4) then
			{
				_return pushBack
				["RSPack_1e",200000];
				_return pushBack
				["I_Heli_light_03_unarmed_F",200000];
				if(__GETC__(life_coplevel) > 5) then
				{
					_return pushBack
					["B_Heli_Transport_01_F",200000];
					if(__GETC__(life_coplevel) > 7) then
					{
						_return pushBack
						["kyo_MH47E_base",200000];
						_return pushBack
						["IVORY_T6A_1",500000];
					};
				};
			};
			
		};
	};
	
	case "cop_airhq":
	{
		_return pushBack
		["B_Heli_Light_01_F",75000];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",200000];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_Boat_Armed_01_minigun_F",75000],
			["B_SDV_01_F",100000]
		];
	};
};

_return;
