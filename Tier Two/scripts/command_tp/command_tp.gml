var _array = argument0;
//disregard first one as it is just the name of the command, this was just easy for my lazy ass
//motherfucker is a string make sure use real
var _clientId = real(_array[1]) //get the client id from the array 
var _x = real(_array[2]) //get the x from the array
var _y = real(_array[3]) //get the y from the array

//Do x and y checks
if !(0 < x < room_width)
{
	return "X is outisde of room parameters. Room width is " + string(room_width) + " supplied x was " + string(x)	
}

if !(0 < y < room_height)
{
	return "Y is outisde of room parameters. Room height is " + string(room_height) + " supplied y was " + string(y)	
}

_client = fGetClientById(_clientId)

if (_client != noone)
{
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
		f_ConsoleAddMessage("Teleported player " + string(_clientId) + " to (" + string(x) + "," + string(y) + ")")
	}
}
else
{
	f_ConsoleAddMessage("Could not find a player with the id of " + string(_clientId) + " _client is " + string(_client)) //-4 is noone btw
}
