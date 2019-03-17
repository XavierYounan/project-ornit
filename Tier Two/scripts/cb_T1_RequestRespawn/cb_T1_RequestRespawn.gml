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
		m_imputLog = [0,0,current_time,0,0,0,false]
		
		middleRoom = [room_width/2,room_height/2]
		
		xMoveDir = sign(room_width/2 - x)
		yMoveDir = sign(room_height/2 - y)
		
		while(place_meeting(x,y,oWall))
		{
			x += xMoveDir
			y += yMoveDir
		}
	}
}