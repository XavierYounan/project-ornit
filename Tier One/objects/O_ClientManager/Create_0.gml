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

result = gnet_connect("127.0.0.1",3001)
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