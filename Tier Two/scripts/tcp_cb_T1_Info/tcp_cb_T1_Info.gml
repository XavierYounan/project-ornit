var socket = argument0
var _recievedData = argument1
var ip = argument2

var port = _recievedData[0]; //buffer_u16 
var _username = _recievedData[1] //buffer_string
var _character = _recievedData[2] //buffer_u8

var UDP_connectionId = gnet_get_connection_id(ip,port)
		
ds_map_add(TCP_manager.UDP_connectionIdMap,socket,UDP_connectionId)
ds_map_add(TCP_manager.TCP_socketMap,UDP_connectionId,socket)

var client = fGetClientById(UDP_connectionId)

if (client == null)
{
	f_ConsoleAddMessage("Dropping T1 Info client does not exist!")	
}

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
		hero.parentId = id
	
		state = state.sendingInfo
	}	
}
