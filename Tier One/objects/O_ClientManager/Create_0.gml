///@desc Init

if (!assert_singleton()) return;

m_GameConsole = instance_create_depth(-10,-10,-100,O_GameConsole)

MAX_PLAYERS = 1;

var result = gnet_start_network(MAX_PLAYERS,PROTOCOL_ID,-1, "Client")

if (!result)
{
	show_message("The provided port may not be open, could not initalise network!");
	instance_destroy();
	return;
}
else
{
	show_debug_message("Port = " + string(global.gnet_myPort))	
}

result = gnet_connect(global.IP,global.PORT) 
fConsoleAddMessage(string(result))
if (result[0] == null)
{
	show_message(result[1]);
}

timeManager = instance_create_depth(0,0,0,oServerTime)

with (timeManager)
{
	var _res = assert_singleton()	
	
	if (_res = false)
	{
		show_error("There should only ever be one time manager created", true)	
	}
}

m_imputPacketSent = 1 //the first imput packet is already defined by the server 

m_unreadImputs = []

PLAYING = 0
SENDINGINFO = 1
ERROR = 3

managerState = SENDINGINFO

enum CHARACTER
{
	NULL,
	NINJA,
	MAGNET_BOI
}

m_character = CHARACTER.NINJA

m_gunAngle = 0

m_username = "Big Chungus"

packet_number = 0 //keeps count for sever reconsiliation

//loading functions
m_repeatTimes = 10
m_repeatFrequency = game_get_speed(gamespeed_fps)
m_timeLeft = m_repeatFrequency
m_repeatLeft = m_repeatTimes


enum UNREAD_IMPUTS
{
	HSP = 0,
	VSP,
	PACKET_NUMBER,
	GUN_ANGLE,
	DELTA_TIME
}

enum LOCAL_LATEST_POSITION
{
	X = 0,
	Y,
	HSP,
	VSP,
}
