///@desc Init
if (!assert_singleton()) return;

//Make sure network can be created, get past firewall before connecting
gnet_start_network(1,PROTOCOL_ID,3111, "temp connection")
gnet_stop_network()

m_GameConsole = instance_create_depth(-10,-10,-100,O_GameConsole)

global.MAX_PLAYERS = 2;

var result = gnet_start_network(global.MAX_PLAYERS,PROTOCOL_ID,-1, "Client")

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

instance_create_depth(0,0,0,TCP_manager)

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


PLAYING = 0
DEAD = 1
SENDINGINFO = 2

managerState = SENDINGINFO

enum CHARACTER
{
	NULL,
	NINJA,
	MAGNET_BOI
}

m_gunAngle = 0

m_username = global.USERNAME
m_character = CHARACTER.NULL

packet_number = 0 //keeps count for sever reconsiliation

sent_tcp_info = false