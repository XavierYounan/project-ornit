//cb_T1_SelfPlayerInfo()
var _connectionId  = argument0;
var _receivedData  = argument1;

var _username = _receivedData[0]; //buffer_string
var _character = _receivedData[1]; //buffer_u8

var _client = fGetClientById(_connectionId)

with (_client)
{
	if (state != state.sendingInfo)
	{
		m_username = _username
		m_character = _character

		if(m_character = CHOSEN_CHARACTER.NINJA)
		{
			hero = instance_create_depth(0,0,-100,oNinja)
		}
	
		if(m_character = CHOSEN_CHARACTER.MAGNET_BOI)
		{
			hero = instance_create_depth(0,0,-100,oMagnetBoi)
		}
		
		hero.clientId = _connectionId
		hero.parentClient = _client
	
		global.T1_CONNECTION_ID_LOADED_IN_LIST = fArrayAppend(global.T1_CONNECTION_ID_LOADED_IN_LIST,_connectionId)
			
		state = state.sendingInfo
	}
}

