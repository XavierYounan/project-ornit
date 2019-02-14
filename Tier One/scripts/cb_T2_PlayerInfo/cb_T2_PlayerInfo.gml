//cb_T2_PlayerInfo
var _connectionId  = argument0;
var _receivedData  = argument1;

var _client = _receivedData[0] //buffer_u8
var _character = _receivedData[1]; //buffer_u8
var _username = _receivedData[2]; //buffer_string

var _client = fGetClientById(_connectionId)

with (_client)
{
	m_username = _username
	m_character = _character
}

