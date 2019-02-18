//cb_T2_PlayerInfo
var _connectionId  = argument0;
var _receivedData  = argument1;

var _client = _receivedData[0] //buffer_u8
var _character = _receivedData[1]; //buffer_u8
var _username = _receivedData[2]; //buffer_string


with (instance_create_depth(0,0,0,oPlayer))
{
	m_PlayerId = _clientId
	latest_acknowleged_packet = [0,0,oServerTime.m_serverTime] //update most recent position knowledge	
	_client = fGetClientById(_clientId)
	m_username = _username
	m_character = _character
	playerState = PLAYING
	
	if (oCharacter = undefined)
	{
		oCharacter = instance_create_depth(0,0,-100,oNinja)
	}
	
	if (oCharacterLast = undefined)
	{
		oCharacterLast = instance_create_depth(0,0,-100,oNinja)
	}
}