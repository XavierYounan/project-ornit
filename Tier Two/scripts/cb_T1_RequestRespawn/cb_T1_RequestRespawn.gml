//cb_T1_SelfPlayerInfo()
var _connectionId  = argument0;
var _receivedData  = argument1;

var _x = _receivedData[0]; //buffer_u32
var _y = _receivedData[1]; //buffer_u32

var _client = fGetClientById(_connectionId)

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
		
		var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_STATE_UPDATE,_connectionId,t1state_PLAYING)
		gnet_packet_send_to_list(_packet,global.T1_CONNECTION_ID_LIST)
	}
}