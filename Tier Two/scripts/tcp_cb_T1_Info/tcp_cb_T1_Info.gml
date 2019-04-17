var _connectionId = argument0
var _recievedData = argument1

var _username = _recievedData[0]
var _character = _recievedData[1]

var client = fGetClientById(_connectionId)

with(client)
{
	if (state == state.waitingForInfo)
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
		hero.parentClient = client
	
		global.T1_CONNECTION_ID_LOADED_IN_LIST = fArrayAppend(global.T1_CONNECTION_ID_LOADED_IN_LIST,_connectionId)
			
		state = state.sendingInfo
	}	
}
