//cb_T1_SelfPlayerInfo()
var socket = argument0;
var _receivedData  = argument1;

var _x = _receivedData[0]; //buffer_u32
var _y = _receivedData[1]; //buffer_u32

var _clientId = TCP_manager.UDP_connectionIdMap[? socket]
var _client = fGetClientById(_clientId)

if(_client == undefined)
{
	f_ConsoleAddMessage("Recieved a respawn request for an undefined client")	
	return;
}


if !position_meeting(_x,_y,oRespawn)
{
	f_ConsoleAddMessage("The Click was not on the Respawn point, Hacking?")
	return;
}

with(_client)
{
	hp = 100
	x  = _x 
	y = _y
	m_imputLog = []
		
	middleRoom = [room_width/2,room_height/2]
		
	xMoveDir = sign(room_width/2 - x)
	yMoveDir = sign(room_height/2 - y)
		
	while(place_meeting(x,y,oWall))
	{
		x += xMoveDir
		y += yMoveDir
	}
		
	state = state.playing
		
	var list = global.T1_CONNECTION_ID_LIST
	var _arrSize = array_length_1d(list)
	for(var i = 0; i < _arrSize; i++)
	{
		packet_tcp_send(list[i],TCP_PACKETS.T2_STATE_UPDATE,[_clientId,t1state_PLAYING])
	}	
}