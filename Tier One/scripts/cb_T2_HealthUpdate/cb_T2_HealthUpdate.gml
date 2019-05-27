//cb_T2_HealthUpdate
var _connectionId  = argument0;
var _receivedData  = argument1;

var _clientId = _receivedData[0]; //buffer_u8
var _health = _receivedData[1]; //buffer_u8

var client = fGetClientById(_clientId)

if client != noone
{	
	if (client.hero = undefined) return;
	client.hero.hp = _health
}

