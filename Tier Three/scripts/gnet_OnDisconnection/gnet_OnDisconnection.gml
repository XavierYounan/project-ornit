///@desc **System Callback** This function is called when communication has stopped and the Connection destroyed.	
///@param {Number} Connection This is the connectionId of the disconnected connection.

var _connectionId = argument0;   // The id of the connection that disconnected from us

with (oConnectedServer)
{
	if (m_connectionId == _connectionId)
	{
		instance_destroy()	
		fConsoleAddMessage("Connection ID " + string(_connectionId) + " disconnected")
		return;
	}
}

fConsoleAddMessage("Connection ID " + string(_connectionId) + " disconnected but does not exist")