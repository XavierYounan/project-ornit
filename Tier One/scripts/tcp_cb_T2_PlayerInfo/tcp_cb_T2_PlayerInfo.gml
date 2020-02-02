//cb_T2_PlayerInfo
var _receivedData  = argument0;

var _clientId = _receivedData[0] //buffer_u8
var _username = _receivedData[1]; //buffer_string

with (instance_create_depth(0,0,0,oPlayer))
{
	m_PlayerId = _clientId
	event_user(PLAYER_EVENT.DEAD)
	isLocal = false
	username = _username
	debug_log("recieved player info and created a non local player, client id " + string(m_PlayerId), ERROR_LEVEL.INFO, id, "NETWORKING")
}

