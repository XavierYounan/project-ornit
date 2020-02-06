//cb_T2_LocalPlayerInfo()
var _receivedData  = argument0;

var _clientId = _receivedData[0]; //buffer_8
var _username = _receivedData[1]; //buffer_string

with (instance_create_depth(0,0,0,oPlayer))
{
	m_PlayerId = _clientId	
	event_user(PLAYER_EVENT.DEAD)
	isLocal = true
	username = _username
	
	with (oCamera)
	{
		localPlayer = other.id //make the camera follow the local player
	}
	
	debug_log("recieved player info and created a local player, client id " + string(m_PlayerId), ERROR_LEVEL.INFO, id, "NETWORKING")
}
with (O_ClientManager)
{
	managerState = PLAYING
}
