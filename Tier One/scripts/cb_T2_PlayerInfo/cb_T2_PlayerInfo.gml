//cb_T2_PlayerInfo
var _connectionId  = argument0;
var _receivedData  = argument1;

var _clientId = _receivedData[0] //buffer_u8
var _character = _receivedData[1]; //buffer_u8
var _username = _receivedData[2]; //buffer_string

with (instance_create_depth(0,0,0,oPlayer))
{
	m_PlayerId = _clientId
	playerState = PLAYER_STATE.PLAYING
	isLocal = false
	
	switch (_character)
	{
		case CHARACTER_LIST.NINJA:
		{
			hero = instance_create_depth(0,0,-100,oNinja)
			hero.itemList[NINJA_ITEMS.GUN] = instance_create_depth(0,0,-101,oNinjaGun)
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
		isLocal = false
		latest_acknowleged_packet = [0,0,0,0,0,current_time] //update most recent position knowledge	
		m_username = _username
		m_character = _character
	}
}