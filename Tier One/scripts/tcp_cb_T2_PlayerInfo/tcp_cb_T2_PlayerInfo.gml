//cb_T2_PlayerInfo
var _receivedData  = argument0;

var _clientId = _receivedData[0] //buffer_u8
var _character = _receivedData[1]; //buffer_u8
var _username = _receivedData[2]; //buffer_string

with (instance_create_depth(0,0,0,oPlayer))
{
	m_PlayerId = _clientId
	playerState = PLAYER_STATE.DEAD
	isLocal = false
	
	fConsoleAddMessage("character is " + string(_character))
	
	switch (_character)
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
	
	with (hero)
	{
		isLocal = false
		latest_acknowleged_packet = [0,0,0,0,0,current_time] //update most recent position knowledge
		parent = other.id
		m_username = _username
		m_character = _character
	}
}





















