/// cb_T2_StateUpdate ()
//@desc set the state for players
var _receivedData  = argument0;

var _clientId = _receivedData[0]; //buffer_u8
var _state = _receivedData[1]; //buffer_u8

var _client = fGetClientById(_clientId)

if (_client) != noone
{
	with (_client)
	{
		if (hero = undefined) fConsoleAddMessage(string_build("Recieved state update but hero was undefined, clientId {}, state {}", _clientId, _state)); return;
		with(hero)
		{
			event_user(_state)	
		}
	}
} 
