/// @description Hud for debugging

if (!assert_singleton()) { return; }

enum DEBUG_MODES
{
	CONSOLE,
	CONNECTION_INFO,
	HITBOXES,
	DROPPED_PACKETS,
	SERVER_TIME,
	UNREAD_PACKETS
}

debugMode = DEBUG_MODES.CONSOLE

//draw in top right 
textBuffer = 10

droppedPacketLog = instance_create_depth(0,0,0,oDroppedPacketLog)