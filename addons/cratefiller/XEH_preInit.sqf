#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

if(!isMultiplayer) exitWith { ERROR_MSG(format ["[KP] [%1] [PRE] [CRATEFILLER] THIS MOD DOES NOT WORK IN SINGLEPLAYER. CRATE FILLER WILL TO BE AVAILABLE.", diag_tickTime]) };

[] call FUNC(preInit);