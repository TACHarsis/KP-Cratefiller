#include "script_component.hpp"
/*
    Killah Potatoes Cratefiller v1.2.0

    FUNC(manageActions)

    File: fnc_cratefiller_manageActions.sqf
    Author: Dubjunk - https://github.com/KillahPotatoes
    Date: 2019-09-16
    Last Update: 2019-09-16
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

if(_object getVariable [QGVAR(action_set), false]) exitWith {};

if(KP_ace_enabled) then { [_object] call FUNC(manageAceActions); };
_object addAction ["<t color='#FF8000'>" + localize "STR_KP_CRATEFILLER_ACTIONOPEN" + "</t>", {[_this] call FUNC(openDialog);}, nil, 20, false, true, "", QUOTE(!(KP_ace_enabled && GVAR(param_useAceActions))), GVAR(param_interactRadius)];

_object setVariable [QGVAR(action_set), true];

true
