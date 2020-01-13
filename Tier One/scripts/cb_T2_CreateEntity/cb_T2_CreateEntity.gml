/// cb_T2_CreateEntity
//An entity (projectile etc) is created
var _connectionId = argument0;
var _receivedData  = argument1;

var _creatorClientId = _receivedData[0]; //buffer_u8
var _x = _receivedData[1]; //buffer_s32
var _y =  _receivedData[2]; //buffer_s32
var _direction = _receivedData[3];  //buffer_u16
var _entityId = _receivedData[4]; //buffer_u8


switch (_entityId)
{
	case ENTITY.NINJA_ARROW:
	{
		with(instance_create_depth(_x,_y,-103,oNinjaArrow))
		{
			direction = _direction	
			image_angle = direction-90
			creator = _creatorClientId
		}
		break;
	}
	
	default: debug_log("Recieved create entity request but couldnt find associated entity, connectionId: " + string(_connectionId))
}