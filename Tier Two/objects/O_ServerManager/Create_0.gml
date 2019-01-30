/// @description Init

if (!assert_singleton()) return;

m_GameConsole = instance_create_depth(-10,-10,-100,O_GameConsole)

MAX_PLAYERS = 8;

var result = gnet_start_network(MAX_PLAYERS,PROTOCOL_ID,3001, "Server")

if (!result)
{
	show_message("The provided port may not be open, could not initalise network!");
	instance_destroy();
	return;
}
else
{
	//Connect to major server and log ip and port 
	var result = gnet_connect("127.0.0.1",3002)
	f_ConsoleAddMessage(string(result))
	if (result[0] == null)
	{
		show_message(result[1]);
	}
	room_goto_next()
}
//create Client Update Spreader object
m_ClientUpdateSpreader = instance_create_depth(-10,-10,0,oClientUpdateSpreader)

//create connection type lists
global.T3_CONNECTION_ID_LIST = []
global.T1_CONNECTION_ID_LIST = []
global.SPECTATOR_ID_LIST = [] //TODO create spectator functionality
