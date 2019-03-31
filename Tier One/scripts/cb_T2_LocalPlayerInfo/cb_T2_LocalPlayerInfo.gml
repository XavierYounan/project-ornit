//cb_T2_LocalPlayerInfo()
var _connectionId  = argument0;
var _receivedData  = argument1;

var _clientId = _receivedData[0]; //buffer_8
var _character = _receivedData[1]; //buffer_u6
var _username = _receivedData[2]; //buffer_string

fConsoleAddMessage("Received Local Player info which was " + string(_receivedData))

with (instance_create_depth(0,0,0,oPlayer))
{
	m_PlayerId = _clientId
	isLocal = true
	latest_acknowleged_packet = [0,0,0,0,0] //update most recent position knowledge	
	_client = fGetClientById(_clientId)
	m_username = _username
	m_character = _character
	playerState = PLAYING
	
	
	with (oCamera)
	{
		localPlayer = other.id //make the camera follow the local player
		xTo = x = other.x + (mouse_x - other.x)/4 //snap x xoords
		yTo = y = other.y + (mouse_y - other.y)/4 //snap y coords
		state = CAMERA_STATE.FOLLOW_PLAYER_CREATE
		
	}
	oCamera.localPlayer = id
	
	if (itemList[CHARACTER] = undefined)
	{
		itemList[CHARACTER] = instance_create_depth(0,0,-100,oNinja)
		itemList[NINJAGUN] = instance_create_depth(0,0,-101,oNinjaGun)
	}
}

with (O_ClientManager)
{
	managerState = PLAYING
}

