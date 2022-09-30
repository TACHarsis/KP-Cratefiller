#include "script_component.hpp"
/*
    Killah Potatoes Cratefiller v1.2.0

    FUNC(manageAceActions)

    File: fnc_cratefiller_manageAceActions.sqf
    Author: Dubjunk - https://github.com/KillahPotatoes
    Date: 2019-09-16
    Last Update: 2020-10-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds actions to the cratefiller objects.

    Parameter(s):
        _object - defines the object to apply the action [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_object", objNull, [objNull]]
];

private _action = ["Cratefiller", localize "STR_KP_CRATEFILLER_TITLE", "\z\KPCF\addons\cratefiller\ui\res\kp512_CA", {[_this] call FUNC(openDialog);}, {GVAR(param_useAceActions)}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

true
