var _clientId = argument0;
var _x = argument1;
var _y = argument2;

var _client = fGetClientById(_clientId)

with (_client)
{
	x = _x
	y = _y
	
	m_imputLog = []
	m_imputLog[0] = [0,0,current_time,0,0,0,false]
		
	middleRoom = [room_width/2,room_height/2]
		
	xMoveDir = sign(room_width/2 - x)
	yMoveDir = sign(room_height/2 - y)
		
	while(place_meeting(x,y,oWall))
	{
		x += xMoveDir
		y += yMoveDir
	}
}