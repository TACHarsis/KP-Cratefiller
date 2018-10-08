/*
    Killah Potatoes Cratefiller

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Provides the cratefiller dialog.
*/

class KPCF_dialog {
    idd = 758067;
    movingEnable = 0;

    class controlsBackground {

        class KP_DialogTitle: KPGUI_PRE_DialogTitleS {
            text = "$STR_KPCF_TITLE";
        };

        class KP_DialogArea: KPGUI_PRE_DialogBackgroundS {};

        // Crates

        class KP_TransportTitle: KPGUI_PRE_InlineTitle {
            text = "$STR_KPCF_TITLETRANSPORT";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,0,48);
            w = KP_GETW(KP_WIDTH_VAL_S,1);
            h = KP_GETH(KP_HEIGHT_VAL_S,16);
        };

        class KP_TextNewCrate: KPGUI_PRE_Text {
            text = "$STR_KPCF_NEWCRATE";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
        };

        class KP_TextAvailableInventory: KP_TextNewCrate {
            text = "$STR_KPCF_AVAILABLEINVENTORY";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
        };

        // Equipment

        class KP_EquipmentTitle: KP_TransportTitle {
            text = "$STR_KPCF_TITLEEQUIPMENT";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,7,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
        };

        // Inventory

        class KP_InventoryTitle: KP_TransportTitle {
            text = "$STR_KPCF_TITLEINVENTORY";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,7,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
        };

    };

    class controls {

        class KP_DialogCross: KPGUI_PRE_DialogCrossS {};

        // Crates

        class KP_ComboCrate: KPGUI_PRE_Combo {
            idc = 75801;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,4);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
        };

        class KP_ComboCargo: KP_ComboCrate {
            idc = 75802;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,3,4);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
        };

        class KP_ButtonSpawnCrate: KPGUI_PRE_InlineButton {
            text = "$STR_KPCF_SPAWNCRATE";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            onButtonClick = "call KPCF_fnc_spawnCrate";
        };

        class KP_ButtonDeleteCrate: KP_ButtonSpawnCrate {
            text = "$STR_KPCF_DELETECRATE";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
            onButtonClick = "call KPCF_fnc_deleteCrate";
        };

        // Equipment

        class KP_ComboEquipment: KPGUI_PRE_Combo {
            idc = 75810;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,10,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            onLBSelChanged = "call KPCF_fnc_equipmentList";
        };

        class KP_ComboWeapons: KP_ComboEquipment {
            idc = 75811;
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,12,48);
            onLBSelChanged = "call KPCF_fnc_magazineList";
        };

        class KP_EquipmentList: KPGUI_PRE_ListBox {
            idc = 75812;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,14,48);
            w = KP_GETW(KP_WIDTH_VAL_S,(16/7));
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/34));
        };

        class KP_ButtonAddEquipment: KPGUI_PRE_InlineButton {
            text = "+ 1";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,7,16);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,14,48);
            w = KP_GETW(KP_WIDTH_VAL_S,16);
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/8.5));
            onButtonClick = "[1] call KPCF_fnc_addEquipment";
        };

        class KP_ButtonAddEquipment5: KP_ButtonAddEquipment {
            text = "+ 5";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,22.5,48);
            onButtonClick = "[5] call KPCF_fnc_addEquipment";
        };

        class KP_ButtonAddEquipment10: KP_ButtonAddEquipment {
            text = "+ 10";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,31,48);
            onButtonClick = "[10] call KPCF_fnc_addEquipment";
        };

        class KP_ButtonAddEquipment20: KP_ButtonAddEquipment {
            text = "+ 20";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,39.5,48);
            onButtonClick = "[20] call KPCF_fnc_addEquipment";
        };

        // Inventory

        class KP_InventoryList: KPGUI_PRE_ListBox {
            idc = 75820;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,9,16);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,10,48);
            w = KP_GETW(KP_WIDTH_VAL_S,(16/6));
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/36));
        };

        class KP_InventoryAmount: KP_InventoryList {
            idc = 75821;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,10,48);
            w = KP_GETW(KP_WIDTH_VAL_S,16);
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/36));
        };

        class KP_ButtonRemoveEquipment: KPGUI_PRE_InlineButton {
            text = "- 1";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,15,16);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,10,48);
            w = KP_GETW(KP_WIDTH_VAL_S,16);
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/9));
            onButtonClick = "[1] call KPCF_fnc_removeEquipment";
        };

        class KP_ButtonRemoveEquipment5: KP_ButtonRemoveEquipment {
            text = "- 5";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,19,48);
            onButtonClick = "[5] call KPCF_fnc_removeEquipment";
        };

        class KP_ButtonRemoveEquipment10: KP_ButtonRemoveEquipment {
            text = "- 10";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,28,48);
            onButtonClick = "[10] call KPCF_fnc_removeEquipment";
        };

        class KP_ButtonRemoveEquipment20: KP_ButtonRemoveEquipment {
            text = "- 20";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,37,48);
            onButtonClick = "[20] call KPCF_fnc_removeEquipment";
        };

    };
};
