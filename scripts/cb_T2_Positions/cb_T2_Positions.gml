/// cb_T2_Positions()
//@desc T2 sends positional informtion for player
var _connectionId  = argument0;
var _receivedData  = argument1;

var _x = _receivedData[0]; //buffer_s32
var _y = _receivedData[1]; //buffer_s32
var _player = _receivedData[2]; //buffer_u8
var _timePacketRecieved = current_time //not set

//Use connection id to find player
var _client = fGetClientById(_player)

//if doesnt exist create a new player TODO: when player connect should be created
if (_client == noone)
{
	with (instance_create_depth(x,y,10,oPlayer))
	{
		m_PlayerId = _player;
	}
}
else
{
	//update players x and y coords
	with (_client)
	{
		var _array = [_x,_y,_timePacketRecieved]
		m_coordinateArray = fArrayMoveBack(m_coordinateArray,1)
		m_coordinateArray[0] = _array
	}
}