//cb_T1_SelfPlayerInfo()
var socket = argument0;
var _receivedData  = argument1;

var _character = _receivedData[0] //buffer_u8
var _x = _receivedData[1]; //buffer_u32
var _y = _receivedData[2]; //buffer_u32

var _clientId = TCP_manager.UDP_connectionIdMap[? socket]
var _client = fGetClientById(_clientId)

debug_log("Recieved Respawn request")

if(_client == null)
{
	debug_log("Recieved a respawn request for an undefined client")	
	return;
}


if !position_meeting(_x,_y,oRespawn)
{
	debug_log("The Click was not on the Respawn point, Hacking?")
	return;
}



with(_client)
{
	if (state != state.dead)
	{
		debug_log("Respawn request denied, you are not dead!")	
		return;
	}
	
	character = _character
	
	switch(_character)
	{
		case CHOSEN_CHARACTER.NINJA:
		{
			hero = instance_create_depth(_x,_y,-100,oNinja)
			break;
		}
		
		case CHOSEN_CHARACTER.MAGNET_BOI:
		{
			hero = instance_create_depth(_x,_y,-100,oMagnetBoi)
			break;
		}
		
		default:
		{
			debug_log("Recieved respawn request but character was not known, REQUEST DENIED!")
			return;
		}
	}

		
	character = _character
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
		
	debug_log("Completed the respawn request, State: " + string(state))
		
	state = state.playing
		
	var list = global.T1_CONNECTION_ID_LIST
	var _arrSize = array_length_1d(list)
	for(var i = 0; i < _arrSize; i++)
	{
		packet_tcp_send(list[i],TCP_PACKETS.T2_PLAYER_RESPAWN,[_clientId,_character])
		debug_log("Sent respawn data to " + string(list[i]))
	}	
	
	
}