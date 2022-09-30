#include "script_component.hpp"
/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Deletes the nearest crate.

    Parameter(s):
    NONE

    Returns:
    NONE
*/

// Check for empty variable
if (isNull GVAR(activeStorage)) exitWith {
    hint localize "STR_KPCF_HINTSELECTION";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
};

// Check if the storage is in range
if ((GVAR(activeStorage) distance2D GVAR(activeSpawn)) > GVAR(spawnRadius)) exitWith {
    hint localize "STR_KPCF_HINTRANGE";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    [] remoteExecCall [QFUNC(getNearStorages), (allPlayers - entities "HeadlessClient_F")];
};

// Check if the active storage is a pre defined crate
if (!((typeOf GVAR(activeStorage)) in GVAR(crates))) exitWith {
    hint localize "STR_KPCF_HINTNONDELETEABLE";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
};

// Delete crate
deleteVehicle GVAR(activeStorage);

private _config = [typeOf GVAR(activeStorage)] call FUNC(getConfigPath);
private _name = (getText (configFile >> _config >> typeOf GVAR(activeStorage) >> "displayName"));

GVAR(activeStorage) = objNull;

[] remoteExecCall [QFUNC(getInventory), (allPlayers - entities "HeadlessClient_F")];
[{[] remoteExecCall [QFUNC(getNearStorages), (allPlayers - entities "HeadlessClient_F")];}, [], 1] call CBA_fnc_waitAndExecute;

hint format [localize "STR_KPCF_HINTDELETE", _name];
[{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
