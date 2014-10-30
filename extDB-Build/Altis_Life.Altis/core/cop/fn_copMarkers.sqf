/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_cops","_rank"];
_markers = [];
_cops = [];

sleep 0.5;
if(visibleMap) then {
	{if(side _x == west) then {_cops pushBack _x;}} foreach playableUnits; //Fetch list of cops / blufor
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_rank = switch (_x getVariable ["rank",rank _x]) do {
					case 1: {"Recrue"};
					case 2: {"Agent"}; 
					case 3: {"Caporal"};
					case 4: {"Sergent"};
					case 5: {"Lieutenant"};
					case 6: {"Capitaine"};
					case 7: {"Major"};
					case 8: {"Colonel"};
					case 9: {"Commandant"};
					case 10:{"Chef Police"};
					};
		_marker setMarkerTextLocal format[" [%1] %2",_rank,_x getVariable ["realname",name _x]];
		//_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
	
		_markers pushBack [_marker,_x];
	} foreach _cops;
		
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_cops = [];
};