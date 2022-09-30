#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "KPCF_main" };
        authors[] = {"Dubjunk", "Cat Harsis"};
        VERSION_CONFIG;
    };
};

// Configs
#include "CfgEventHandlers.hpp"
#include "ui\KPGUI_defines.hpp"
#include "ui\dialogs\KPCF_dialog.hpp"
