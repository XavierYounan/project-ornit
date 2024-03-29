/// cb_T2_Positions()
//@desc T2 sends positional informtion for player
var _connectionId = argument0;
var _receivedData  = argument1;

var _x = _receivedData[0]; //buffer_s32
var _y = _receivedData[1]; //buffer_s32
var _player = _receivedData[2]; //buffer_u8
var _timePacketRecieved = current_time //not set
var _gunDir = _receivedData[3] //buffer_u16
var _state = _receivedData[4] //buffer_u8

//Use connection id to find player
var _client = fGetClientById(_player)

//if doesnt exist create a new player TODO: when player connect should be created
if (_client == noone)
{
	debug_log("Recieved Position packet but could not find associated player. Are they loaded in? Connection Id: " + string(_connectionId),1)
	return;
}

//update players x and y coords
with (_client)
{
	if (hero = undefined)
	{
		debug_log("Hero is undeifned, disregarding notlocal positon packet. Connection Id: " + string(_connectionId),1) 
		return;
	}
	
	with(hero)
	{
		var _array = [_x,_y,_timePacketRecieved,_gunDir,_state]
		m_coordinateArray = fArrayMoveBack(m_coordinateArray,1)
		m_coordinateArray[0] = _array
		return;
	}
}

debug_log("Couldnt fild _client: cb_T2_OtherPosition. Connection Id: " + string(_connectionId),1)
