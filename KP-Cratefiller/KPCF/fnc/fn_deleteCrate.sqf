/*
    Killah Potatoes Cratefiller

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
if (KPCF_activeStorage == objNull) exitWith {};

// Check if the active storage is a pre defined createTeam
if (!(KPCF_activeStorage in KPCF_crates)) exitWith {};

deleteVehicle KPCF_activeStorage;

call KPCF_fnc_getInventory;
