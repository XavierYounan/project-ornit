/// cb_T2_StateUpdate ()
//@desc set the state for players
var _connectionId  = argument0;
var _receivedData  = argument1;

var _clientId = _receivedData[0]; //buffer_u8
var _state = _receivedData[1]; //buffer_u8

var _client = fGetClientById(_clientId)

if (_client) != noone
{
	_clientId.playerState = _state
}