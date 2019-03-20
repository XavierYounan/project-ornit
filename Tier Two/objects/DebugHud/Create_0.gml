/// @description Hud for debugging

if (!assert_singleton()) { return; }

enum DEBUG_MODES
{
	NOTHING = 1,
	CONNECTION_INFO,
	DROPPED_PACKETS
}

debugMode = DEBUG_MODES.NOTHING

//dropped packets variables
droppedPacketsList = ds_list_create()
droppedPacketsMaxMessages = 20

//draw in top right 
textBuffer = 10




