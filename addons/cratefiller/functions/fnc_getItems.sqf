#include "script_component.hpp"
/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Creates the item lists if generateLists is enabled.

    Parameter(s):
    NONE

    Returns:
    NONE
*/

// Reset variables
GVAR(weapons) = [];
GVAR(grenades) = [];
GVAR(explosives) = [];
GVAR(items) = [];
GVAR(backpacks) = [];

private _configClasses = [];
private _classNames = [];
private _type = [];

// Get all classnames from config
{
    _configClasses append (
        "
            _type = (configName _x) call BIS_fnc_itemType;
            (getNumber (_x >> 'scope') == 2) &&
            ((_type select 0) != '') &&
            ((_type select 0) != 'VehicleWeapon')
        " configClasses _x
    );
} forEach [(configFile >> "CfgMagazines"), (configFile >> "CfgWeapons"), (configFile >> "CfgVehicles"), (configFile >> "CfgGlasses")];

// Convert to classname
{
    _classNames pushBack (configName _x)
} forEach _configClasses;

// Black & whitelisting
_classNames = _classNames - GVAR(blacklistedItems);
_classNames append GVAR(whitelistedItems);

private _specialItems = [];

// Search for special items with wrong config entrys
{
    if (_x isKindOf ["CBA_MiscItem", configfile >> "CfgWeapons"]) then {_specialItems pushBack _x};
} forEach _classNames;

// Sort all classnames into the different categories
{
    _type = _x call BIS_fnc_itemType;
    switch (_type select 0) do {
        case "Weapon": {if ((_type select 1) isEqualTo "UnknownWeapon") then {GVAR(items) pushBack _x} else {if ((_x call BIS_fnc_baseWeapon) == _x) then {GVAR(weapons) pushBack _x;};};};
        case "Mine": {GVAR(explosives) pushBack _x};
        case "Magazine": {if ((((_type select 1) isEqualTo "Grenade") || ((_type select 1) isEqualTo "SmokeShell")) && !((getNumber (configFile >> "CfgMagazines" >> _x >> "type")) == 16)) then {GVAR(grenades) pushBack _x}};
        case "Equipment": {if ((_type select 1) isEqualTo "Backpack") then {GVAR(backpacks) pushBack _x}};
        case "Item": {
            switch (_type select 1) do {
                case "AccessoryMuzzle" : {};
                case "AccessoryPointer" : {};
                case "AccessorySights" : {};
                case "AccessoryBipod" : {};
                default {GVAR(items) pushBack _x};
            };
        };
    };
} forEach (_classnames arrayIntersect _classnames);

GVAR(items) append _specialItems;
