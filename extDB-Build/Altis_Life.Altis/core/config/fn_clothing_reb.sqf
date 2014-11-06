/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,5000],
			["U_I_G_Story_Protagonist_F",nil,7500],
			["U_I_G_resistanceLeader_F",nil,11500],
			["U_O_SpecopsUniform_ocamo",nil,17500],
			["U_O_PilotCoveralls",nil,15610],
			["U_IG_leader","Guerilla Leader",15340],
			["U_O_GhillieSuit",nil,50000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,850],
			["H_Shemag_olive",nil,850],
			["H_ShemagOpen_khk",nil,800],
			["H_HelmetO_ocamo",nil,2500],
			["H_MilCap_oucamo",nil,1200],
			["Kio_Balaclava",nil,150],
			["H_Bandanna_camo",nil,650]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["NeckTight_Red",nil,30],
			["NeckTight",nil,30],
			["NeckTight_WhiteCLR",nil,30],
			["NeckTight_WhiteBLK",nil,30],
			["NeckTight_OD",nil,30],
			["NeckTight_ODCLR",nil,30],
			["NeckTight_ODBLK",nil,30],
			["NeckTight_Dmaripat",nil,30],
			["NeckTight_DMBLK",nil,30],
			["NeckTight_DMCLR",nil,30],
			["NeckTight_Tan",nil,30],
			["NeckTight_TanBLK",nil,30],
			["NeckTight_TanCLR",nil,30],
			["NeckTight_Gry",nil,30],
			["NeckTight_GryBLK",nil,30],
			["NeckTight_GryCLR",nil,30],
			["G_Combat",nil,55],
			["L_Shemagh_Red",nil,30],
			["L_Shemagh_Tan",nil,30],
			["LCG_Shemagh_Tan",nil,30],
			["LBG_Shemagh_Tan",nil,30],
			["L_Shemagh_OD",nil,30],
			["LCG_Shemagh_OD",nil,30],
			["LBG_Shemagh_OD",nil,30],
			["L_Shemagh_Gry",nil,30],
			["LBG_Shemagh_Gry",nil,30],
			["LCG_Shemagh_Gry",nil,30],
			["L_shemagh_white",nil,30],
			["LCG_Shemagh_White",nil,30],
			["Balaclava_GRY",nil,30],
			["Balaclava_OD",nil,30],
			["Shemagh_Face",nil,30],
			["Shemagh_FaceTan",nil,30],
			["Shemagh_FaceRed",nil,30],
			["Shemagh_FaceGry",nil,30],
			["Shemagh_FaceOD",nil,30],
			["T_HoodOD",nil,30],
			["T_HoodTanBlk",nil,30],
			["T_HoodACU",nil,30],
			["T_HoodBlk",nil,30],
			["T_HoodMD",nil,30],
			["T_HoodMW",nil,30],
			["T_HoodTan",nil,30],
			["T_HoodBDU",nil,30],
			["T_HoodTanCLR",nil,30],
			["T_HoodODCLR",nil,30],
			["T_HoodODBLK",nil,30],
			["T_HoodACUBLK",nil,30],
			["T_HoodACUCLR",nil,30],
			["T_HoodBDUCLR",nil,30],
			["T_HoodBDUBLK",nil,30],
			["T_HoodBlkBLK",nil,30],
			["T_HoodBlkCLR",nil,30],
			["T_HoodMDBLK",nil,30],
			["T_HoodMDCLR",nil,30],
			["T_HoodMWCLR",nil,30],
			["T_HoodMWBLK",nil,30]
			
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_BandollierB_cbr",nil,4500],
			["V_HarnessO_brn",nil,7500],
			["V_TacVest_khk",nil,12500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000]
		];
	};
};