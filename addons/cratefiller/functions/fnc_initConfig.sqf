#include "script_component.hpp"
/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Configuration file for various variables of the KP cratefiller.
*/

// The Base object is for the player interaction, so at these object you can open the dialog
GVAR(cratefillerBase) = [
    "Land_Cargo10_military_green_F"
];

// The Spawn object is the point where crates will spawn and acts the center for the GVAR(spawnRadius)
GVAR(cratefillerSpawn) = "Land_HelipadCivil_F";

// This variable defines if the player will be able to spawn and delete crates
GVAR(canSpawnAndDelete) = true;

// If set to "true" the item lists will be generated from the config
GVAR(generateLists) = true;

// These variable defines the range where inventories can be edited
// Example: With an setting of 10 all objects in a radius of 10m from the center of the spawn object can be edited
GVAR(spawnRadius) = 10;

// Defines the distance for the interaction (addAction / ACE)
GVAR(interactRadius) = 5;

// Defines the available crates
GVAR(crates) = [
    "B_supplyCrate_F",
    "CargoNet_01_box_F"
];


// Defines the blacklisted items
// Blacklisted items are used on every category with activated generatedLists and everytime on the magazines and attachments
// So this variable will ensure the block of unwanted items
GVAR(blacklistedItems) = [
    ""
];

// ----- This Variable will only be used with activated generatedLists -----

// Defines the whitelisted items
// Whitelisted items will be added after the item detection to ensure the availability
GVAR(whitelistedItems) = [
    ""
];

// ----- These Variables will be replaced with activated generatedLists -----

// Defines the available weapons
GVAR(weapons) = [
    "arifle_SPAR_01_snd_F",
    "MMG_01_tan_F"
];

// Defines the available grenades
GVAR(grenades) = [
    "HandGrenade",
    "MiniGrenade"
];

// Defines the available explosives
GVAR(explosives) = [
    "DemoCharge_Remote_Mag",
    "ATMine_Range_Mag"
];

// Defines the available items
GVAR(items) = [
    "FirstAidKit",
    "ToolKit"
];

// Defines the available backpacks
GVAR(backpacks) = [
    "B_FieldPack_cbr",
    "B_AssaultPack_cbr"
];
