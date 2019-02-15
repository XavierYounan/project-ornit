//cb_T2_LocalPlayerInfo()
var _connectionId  = argument0;
var _receivedData  = argument1;

var _clientId = _receivedData[0]; //buffer_8
var _character = _receivedData[1]; //buffer_u6
var _username = _receivedData[2]; //buffer_string

var _client = fGetClientById(_clientId)

with (_client)
{
	isLocal = true;
	m_character = _character;
	m_username = _username;
}

with (O_ClientManager)
{
	state = state.playing;
}