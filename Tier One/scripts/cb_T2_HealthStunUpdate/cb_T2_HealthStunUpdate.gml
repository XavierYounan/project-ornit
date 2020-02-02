//cb_T2_HealthUpdate
var _connectionId  = argument0;
var _receivedData  = argument1;

var _clientId = _receivedData[0]; //buffer_u8
var _health = _receivedData[1]; //buffer_u8
var _stunned  =_receivedData[2]; //buffer_bool
var _slowed = _receivedData[3]; //buffer_bool

var client = fGetClientById(_clientId)

if client != noone
{
	with(client)
	{	
		if (hero = undefined) return;
		hero.hp = _health	
		hero.stunned = _stunned
		hero.slowed = _slowed
	}
}
else
{
	debug_log("Couldnt process the health/stun update, cant find the client. ConnectionId: " + string(_connectionId))	
}
