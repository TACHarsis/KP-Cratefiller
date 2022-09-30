#include "script_component.hpp"
/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Adds the items to the active crate.

    Parameter(s):
    NONE

    Returns:
    NONE
*/

// Check if the storage is in range
if ((GVAR(activeStorage) distance2D GVAR(activeSpawn)) > GVAR(spawnRadius)) exitWith {
    hint localize "STR_KPCF_HINTRANGE";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    [] remoteExecCall [QFUNC(getNearStorages), (allPlayers - entities "HeadlessClient_F")];
};

// Check if the storage will be empty
if (count GVAR(inventory) == 0) exitWith {
    clearWeaponCargoGlobal GVAR(activeStorage);
    clearMagazineCargoGlobal GVAR(activeStorage);
    clearItemCargoGlobal GVAR(activeStorage);
    clearBackpackCargoGlobal GVAR(activeStorage);
    [] remoteExecCall [QFUNC(getInventory), (allPlayers - entities "HeadlessClient_F")];
};

// Clear the storage
clearWeaponCargoGlobal GVAR(activeStorage);
clearMagazineCargoGlobal GVAR(activeStorage);
clearItemCargoGlobal GVAR(activeStorage);
clearBackpackCargoGlobal GVAR(activeStorage);

// Count the variable index
private _count = count GVAR(inventory);
private _abort = false;
private _item = "";
private _amount = 0;

// Adapt the cargo into KPCF variable
for "_i" from 0 to (_count-1) do {
    _item = (GVAR(inventory) select _i) select 1;
    _amount = (GVAR(inventory) select _i) select 2;
    if (!(GVAR(activeStorage) canAdd [_item, _amount])) exitWith {
        _abort = true;
    };
    if (((GVAR(inventory) select _i) select 1) isKindOf "Bag_Base") then {
        GVAR(activeStorage) addBackpackCargoGlobal [_item, _amount];
    } else {
        GVAR(activeStorage) addItemCargoGlobal [_item, _amount];
    };
};

// Check for enough inventory capacity
if (_abort) exitWith {
    [] remoteExecCall [QFUNC(getInventory), (allPlayers - entities "HeadlessClient_F")];
    hint format [localize "STR_KPCF_HINTFULL"];
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
};

[] remoteExecCall [QFUNC(getInventory), (allPlayers - entities "HeadlessClient_F")];
