/// @description Hud for debugging

if (!assert_singleton()) { return; }

enum DEBUG_MODES
{
	CONSOLE,
	CONNECTION_INFO,
	HITBOXES
}

debugMode = DEBUG_MODES.CONSOLE


//draw in top right 
textBuffer = 10