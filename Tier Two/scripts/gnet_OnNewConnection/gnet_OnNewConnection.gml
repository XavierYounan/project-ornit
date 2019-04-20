/**
@desc **System Callback**
	  This function is called when a new connection has been established successfully. This
	  is a good place to for example; Save the connection id in a list. This connectionId can
	  be used in the future to send data or identify who sent the data. For example 
@example
	// Script is called
	var _connectionId = argument0;
	
	ds_list_add(Server.clientList, _connectionId);
*/
///@param {Number} Connection This is the connectionId of the disconnected connection.

var _connectionId = argument0;

f_ConsoleAddMessage("New client has connected : " + string(_connectionId))

with (instance_create_depth(-100,-100,-100,oClient))
{
	m_ClientId = _connectionId;	
}

global.T1_CONNECTION_ID_LIST = fArrayAppend(global.T1_CONNECTION_ID_LIST,_connectionId)
		
packet_tcp_send()

//reset update frequency
oClientUpdateSpreader.alarm[0] = 0

//Resend Game stats to Tier Three
fUpdateStatus()