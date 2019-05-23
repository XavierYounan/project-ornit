//cb_T1_SelfPlayerInfo()
var socket = argument0;
var _receivedData  = argument1;

var _character = _receivedData[0] //buffer_u8
var _x = _receivedData[1]; //buffer_u32
var _y = _receivedData[2]; //buffer_u32

var _clientId = TCP_manager.UDP_connectionIdMap[? socket]
var _client = fGetClientById(_clientId)

f_ConsoleAddMessage("Recieved Respawn request")

if(_client == null)
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
	if (state != state.dead)
	{
		f_ConsoleAddMessage("Respawn request denied, you are already spawned!")	
		return;
	}
	
	//destroy the old player
	instance_destroy(hero)
		
	if(_character = CHOSEN_CHARACTER.NINJA)
	{
		hero = instance_create_depth(_x,_y,-100,oNinja)
			
	}
	
	if(_character = CHOSEN_CHARACTER.MAGNET_BOI)
	{
		hero = instance_create_depth(_x,_y,-100,oMagnetBoi)
	}
		
	
	hero.parentId = id
	hero.parentClientId = m_ClientId

	var xMoveDir = sign(room_width/2 - x)
	var yMoveDir = sign(room_height/2 - y)
		
	with(hero)
	{
		while(place_meeting(x,y,oWall))
		{
			x += xMoveDir
			y += yMoveDir
		}
	}
		
	f_ConsoleAddMessage("Completed the respawn request, State: " + string(state))
		
	state = state.playing
		
	var list = global.T1_CONNECTION_ID_LIST
	var _arrSize = array_length_1d(list)
	for(var i = 0; i < _arrSize; i++)
	{
		packet_tcp_send(list[i],TCP_PACKETS.T2_PLAYER_RESPAWN,[_clientId,_character])
	}	
	
	
}