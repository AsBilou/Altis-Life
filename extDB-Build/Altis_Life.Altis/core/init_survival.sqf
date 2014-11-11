[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food = 
	{
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(life_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
			switch(life_thirst) do 
			{
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
			};
		};
	};
	
	while{true} do
	{
		sleep 600;
		[] call _fnc_water;
		sleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

//TODO améliorer en transformant les marcker en invisible puis utiliser "mymarker" setMarkerType "mil_pickup" pour les faire réaparaitre.
_illegalmarkerscops = ["gold_bar_dealer","turtle_1_name_2","turtle_3","turle_dealer_1","Dealer_1","gang_area_2","chop_shop_1","cocaine processing","turtle_1_name_1","turtle_2","turle_dealer","Weed_p_1","gang_area_1","Dealer_1_4","Rebelop","turle_dealer_2","Rebelop_1","gang_area_3","chop_shop_4","Dealer_1_3","heroin_p","Rebelop_2","chop_shop_2","illegal_morphine_process","heroin_1_1","cocaine_1_1","weed_1_1"]; 
_illegalmarkersciv = ["cocaine processing","Dealer_1","Weed_p_1","Dealer_1_4","Dealer_1_3","heroin_p"];
_markerrebel1 = ["cocaine processing","cocaine_1_1","Dealer_1_4","Dealer_1_3","Rebelop"];
_markerrebel2 = ["heroin_p","heroin_1_1","Dealer_1_4","Dealer_1_3","Rebelop_1"];
_markerrebel3 = ["Weed_p_1","weed_1_1","Dealer_1_4","Dealer_1_3","Rebelop_2"];
_deletemarkercops = ["gold_bar_dealer","turtle_1_name_2","turtle_3","turle_dealer_1","gang_area_2","chop_shop_1","turtle_1_name_1","turtle_2","turle_dealer","gang_area_1","turle_dealer_2","gang_area_3","chop_shop_4","chop_shop_2"];
if (playerSide == west) then {
	{ deleteMarkerLocal _x; } forEach _illegalmarkerscops;
};
if (!license_civ_rebel) then {
	{ deleteMarkerLocal _x; } forEach _illegalmarkersciv;
};