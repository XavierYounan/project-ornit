//cb_T2_LocalPlayerInfo()
var _receivedData  = argument0;

var _clientId = _receivedData[0]; //buffer_8
var _character = _receivedData[1]; //buffer_u6

var client = fGetClientById(_clientId)

fConsoleAddMessage("recieved player respawn")

with(client)
{
	switch _character
	{
		case CHARACTER.NINJA:
		{
			hero = instance_create_depth(0,0,-100,oNinja)
			break;	
		} 
		
		case CHARACTER.MAGNET_BOI:
		{
			hero = instance_create_depth(0,0,-100,oMagnetBoi)
			break;	
		} 
	
		default:
		{
			show_error("Recieved info about a player connecting. Character no " + string(_character) + " but that does not exist",true)
			break;
		}	
	}
	
	with(hero)
	{
		latest_acknowleged_packet = [0,0,0,0,0,current_time] //update most recent position knowledge
		parent = other.id
		m_username = other.m_username
		m_PlayerId = _clientId
	}
	
	hero.isLocal = isLocal

	with (oCamera)
	{
		xTo = x = other.hero.x + (mouse_x - other.hero.x)/4 //snap x xoords
		yTo = y = other.hero.y + (mouse_y - other.hero.y)/4 //snap y coords
		state = CAMERA_STATE.FOLLOW_PLAYER_CREATE	
	}
}