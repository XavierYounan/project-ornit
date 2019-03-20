///@desc **System Callback** This function is called when communication has stopped and the Connection destroyed.	
///@param {Number} Connection This is the connectionId of the disconnected connection.

var _connectionId = argument0;   // The id of the connection that disconnected from us

if (instance_exists(oT3))
{
	if (_connectionId = oT3.m_connectionId)
	{
		f_ConsoleAddMessage("You have been dissconnected from the T3 server")
	}
	else
	{
		f_ConsoleAddMessage("Client " + string(_connectionId) + " has disconnected")
		global.T1_CONNECTION_ID_LIST = fArrayRemoveElement(global.T1_CONNECTION_ID_LIST,_connectionId)
		global.T1_CONNECTION_ID_LOADED_IN_LIST = fArrayRemoveElement(global.T1_CONNECTION_ID_LOADED_IN_LIST,_connectionId)
		
		var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_PLAYER_DISCONNECT,_connectionId)
		gnet_packet_send_to_list(_packet,global.T1_CONNECTION_ID_LIST)

	}
}
else
{
	f_ConsoleAddMessage("Client " + string(_connectionId) + " has disconnected") //TODO shut down server
	global.T1_CONNECTION_ID_LIST = fArrayRemoveElement(global.T1_CONNECTION_ID_LIST,_connectionId)
	global.T1_CONNECTION_ID_LOADED_IN_LIST = fArrayRemoveElement(global.T1_CONNECTION_ID_LOADED_IN_LIST,_connectionId)
	
	var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_PLAYER_DISCONNECT,_connectionId)
	gnet_packet_send_to_list(_packet,global.T1_CONNECTION_ID_LIST)
}

var disconnectedClient = fGetClientById(_connectionId)
if (disconnectedClient != noone) //TODO show error no client found 
{
	instance_destroy(disconnectedClient)

}