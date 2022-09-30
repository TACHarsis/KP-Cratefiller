#define COMPONENT cratefiller
#include "\z\KPCF\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_CRATEFILLER
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_CRATEFILLER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CRATEFILLER
#endif

#include "\z\KPCF\addons\main\script_macros.hpp"
