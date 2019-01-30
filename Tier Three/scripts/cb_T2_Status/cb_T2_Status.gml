/// cb_MajorRecieveServerInfo()
//@desc status updates for major server
var _connectionId  = argument0;
var _receivedData  = argument1;

var _numberPlayers = _receivedData[0]; //buffer_u8
var _serverState = _receivedData[1]; //buffer_u8


with (oConnectedServer)
{
	if (m_connectionId = _connectionId)
	{
		m_numberPlayers = _numberPlayers;
		m_serverState = _serverState;
	}
}

