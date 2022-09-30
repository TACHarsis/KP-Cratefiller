#include "script_component.hpp"
/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Dubjunk - https://github.com/KillahPotatoes

    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This will initialize the KP cratefiller functionalities.

    Dependencies:
        * KPGUI
*/

// Only run, when we've a real player
if (hasInterface) then {

    // Read the config file
    [] call FUNC(initConfig);

    // Read the variables
    [] call FUNC(initVariables);

    // Check for ACE
    GVAR(ace) = isClass (configfile >> "CfgPatches" >> "ace_common");

    // Add CBA event handler to the base objects
    {
        [_x, "init", {[_this select 0] call FUNC(manageActions);}, nil, nil, true] call CBA_fnc_addClassEventHandler;
    } forEach GVAR(cratefillerBase);

    // Generate the lists if enabled
    if (GVAR(generateLists)) then {
        [] call FUNC(getItems);
    };

    // Sort the item lists
    GVAR(sortedCrates) = [GVAR(crates)] call FUNC(sortList);
    GVAR(sortedWeapons) = [GVAR(weapons)] call FUNC(sortList);
    GVAR(sortedGrenades) = [GVAR(grenades)] call FUNC(sortList);
    GVAR(sortedExplosives) = [GVAR(explosives)] call FUNC(sortList);
    GVAR(sortedItems) = [GVAR(items)] call FUNC(sortList);
    GVAR(sortedBackpacks) = [GVAR(backpacks)] call FUNC(sortList);

};
