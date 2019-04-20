//cb_T1_SelfPlayerInfo()
var _receivedData  = argument0;

var _clientId = _receivedData[0] //buffer_u8
var _x = _receivedData[1]; //buffer_u32
var _y = _receivedData[2]; //buffer_u32

var _client = fGetClientById(_clientId)

if position_meeting(_x,_y,oRespawn)
{
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
}