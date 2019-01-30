/// cb_ServerRecieveClientReadyUp()
var _connectionId  = argument0;
var _receivedData  = argument1;

var _readyUp = _receivedData[0]; //buffer_bool

client = fGetClientById(_connectionId)

with (client)
{
	m_readyUp = true
}