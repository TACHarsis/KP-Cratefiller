#include "script_component.hpp"
/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Scans the spawn area for possible storages.

    Parameter(s):
    NONE

    Returns:
    NONE
*/

// Dialog controls
private _dialog = findDisplay 758067;
private _ctrlStorage = _dialog displayCtrl 75802;

// Clear the lists
lbClear _ctrlStorage;

// Reset variables
GVAR(nearStorage) = [];

private ["_type", "_config", "_number", "_index", "_picture"];

// Get near objects and check for storage capacity
{
    _type = typeOf _x;
    if (_type == "GroundWeaponHolder") exitWith {};
    _config = [_type] call FUNC(getConfigPath);
    _number = getNumber (configfile >> _config >> _type >> "maximumLoad");
    if (_number > 0) then {
        GVAR(nearStorage) pushBack _x;
    };
} forEach ((GVAR(activeSpawn) nearObjects GVAR(spawnRadius)) select {!(typeOf _x in GVAR(cratefillerBase))});

// Fill the list
{
    _type = typeOf _x;
    _config = [_type] call FUNC(getConfigPath);
    _index = _ctrlStorage lbAdd format ["%1m - %2", round (GVAR(activeSpawn) distance2D _x), getText (configFile >> _config >> _type >> "displayName")];
    _picture = getText (configFile >> _config >> _type >> "picture");
    if (_picture isEqualTo "pictureThing") then {
        _ctrlStorage lbSetPicture [_index, QPATHTOF(img\icon_help.paa)];
    } else {
        _ctrlStorage lbSetPicture [_index, _picture];
    };
} forEach GVAR(nearStorage);
