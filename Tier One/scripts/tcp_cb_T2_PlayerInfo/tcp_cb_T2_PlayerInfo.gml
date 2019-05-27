//cb_T2_PlayerInfo
var _receivedData  = argument0;

var _clientId = _receivedData[0] //buffer_u8
var _character = _receivedData[1]; //buffer_u8
var _username = _receivedData[2]; //buffer_string

with (instance_create_depth(0,0,0,oPlayer))
{
	m_PlayerId = _clientId
	playerState = PLAYER_STATE.DEAD
	isLocal = false
}

fConsoleAddMessage("recieved player info")