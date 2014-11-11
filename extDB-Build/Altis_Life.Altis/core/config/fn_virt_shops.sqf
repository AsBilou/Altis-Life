/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana","morphineill"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Altis Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r","platine_u","gold_r"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop": {["Cafétéria",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit","roadcone","LightGreen","LightRed","PortableLight","RoadConeLight","RoadBarrier","BarGate","TapeSign"]]};
	case "coptools": {["Cop's Tools",["spikeStrip","fuelF","defusekit","roadcone","LightGreen","LightRed","PortableLight","RoadConeLight","RoadBarrier","BarGate","TapeSign"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "gold": {["Gold Buyer",["goldbar"]]};
	case "ingot": {["Ingot Buyer",["platine_r","goldingot","iron_ingot","copper_ingot"]]};
	case "clothes": {["H&M",["chanvre"]]};
	case "hospital": {["Hospital",["morphine"]]};
	case "fastfood": {["Fast Food",["coca"]]};
};