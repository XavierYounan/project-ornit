//cb_T2_CreateBullet()
var _connectionId  = argument0;
var _receivedData  = argument1;

var _clientId = _receivedData[0]; //buffer_8
var _x = _receivedData[1]; //buffer_s32
var _y = _receivedData[2]; //buffer_s32
var _direction = _receivedData[3] //buffer_u16

with(instance_create_depth(_x,_y,-103,oNinjaArrow))
{
	direction = _direction	
	image_angle = direction-90
	creator = _clientId
}
