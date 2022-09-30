#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {  };
        authors[] = {"Dubjunk", "Cat Harsis"};
        VERSION_CONFIG;
    };

    class XADDON: ADDON { // just in-case anything requires "tacgx_main" // honestly not sure if we need that :D
        units[] = {};
        weapons[] = {};
    };
};


class CfgMods {
    class PREFIX {
        dir = "@KPCrateFiller";
        name = "KPCrateFiller";
        
        authors[] = {"Dubjunk", "Cat Harsis"};


        picture 	 = "Title_co.paa"; 	// Picture displayed from the expansions menu. Optimal size is 2048x1024
        hideName	= 0;	// Hide the extension name
        hidePicture	= 0;	// Hide the extension menu

        logoSmall	 = "icon_64_ca.paa";	// Display next to the item added by the mod 64x64
        logo		 = "icon_128_ca.paa";			// Logo displayed in the main menu 128x128
        logoOver	 = "icon_128_highlight_ca.paa";		// When the mouse is over, in the main menu 128x128
        tooltip      = "Get your fill.";
        tooltipOwned = "Who sold this to you?";								// Tool tip displayed when the mouse is left over, in the main menu
        description = "Simplify your logistics with this easy to use crate filler!"; // Overview text, displayed from the extension menu
        overview = "With this script you get a dialog with the ability to manage several inventories. It's created to make logistics easier and pleasant.\
You can spawn and delete defined crates, fill these crates and also other objects with defined items."; //??
        action		 = "https://github.com/KillahPotatoes";			// Website URL, that can accessed from the expansions menu 
        actionName 	 = "Website";

        // Color used for DLC stripes and backgrounds (RGBA)
        dlcColor[] =
        {
            1,
            0.0,
            0.0,
            1
        };       
    };
};

// Configs

