var _client = argument0
var _receivedData  = argument1;

var _clientId = _receivedData[0]; //buffer_u8

var _client = fGetClientById(_clientId)

if (_client != noone)
{
	instance_destroy(_client)
}