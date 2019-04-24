var socket = argument0
var _recievedData = argument1
var ip = argument2

var port = _recievedData[4]; //buffer_u16 
var _username = _recievedData[5] //buffer_string
var _character = _recievedData[6] //buffer_u8

var UDP_connectionId = gnet_get_connection_id(ip,port)
		
ds_map_add(TCP_manager.UDP_connectionIdMap,socket,UDP_connectionId)

var client = fGetClientById(UDP_connectionId)

f_ConsoleAddMessage("Recieved T1_Info")

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
		
		hero.parentClient = client
	
		state = state.sendingInfo
	}	
}
