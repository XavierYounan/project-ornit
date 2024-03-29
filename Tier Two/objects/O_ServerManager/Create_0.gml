/// @description Init

if (!assert_singleton()) return;

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
	//Open up TCP server
	var socket = network_create_server(network_socket_tcp,3003, MAX_PLAYERS);
	if socket < 0
	{
		show_message("The TCP port is not open, cannot start network!")
	}
	else
	{
		with(instance_create_depth(0,0,0,TCP_manager))
		{
			server_socket = socket	
		}
		room_goto_next()
	}	
}

//create Client Update Spreader object
m_ClientUpdateSpreader = instance_create_depth(-10,-10,0,oClientUpdateSpreader)

//create connection type lists
global.T1_CONNECTION_ID_LIST = []
global.T1_CONNECTION_ID_LOADED_IN_LIST = []
global.SPECTATOR_ID_LIST = [] //TODO create spectator functionality
