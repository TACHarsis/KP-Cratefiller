#include "script_component.hpp"
/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Adds actions to the cratefiller objects.

    Parameter(s):
    0 : OBJECT - defines the object to apply the action

    Returns:
    NONE
*/

params [
    ["_cfBase", objNull, [objNull]]
];

if (GVAR(ace)) then {
    [_cfBase] call FUNC(manageAceActions);
} else {
    _cfBase addAction ["<t color='#FF8000'>" + localize "STR_KPCF_ACTIONOPEN" + "</t>", {[_this] call FUNC(openDialog);}, nil, 1, false, true, "", "true", GVAR(interactRadius)];
};
