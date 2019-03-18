/// @description Hud for debugging

if (!assert_singleton()) { return; }

enum DEBUG_MODES
{
	NOTHING,
	CONNECTION_INFO //make sure this one is at the end, add above
}

debugMode = DEBUG_MODES.CONNECTION_INFO