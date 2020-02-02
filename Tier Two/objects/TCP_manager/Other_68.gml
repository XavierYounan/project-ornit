var type = async_load[? "type"];

switch type
{
	case network_type_connect:
	{
		var socket = async_load[? "socket"];
		
		var instance = instance_create_depth(0,0,0,TCP_connection)
		
		var ip = async_load[? "ip"];
		var port = async_load[? "port"];
		
		instance.socket = socket
		instance.port = port
		instance.ip = ip
		
		ds_map_add(TCP_connectionsMap,socket,instance)	
		
		break;
	}
	
	case network_type_disconnect:
	{
		var socket = async_load[? "socket"];
		
		var instance = TCP_connectionsMap[? socket]

		ds_map_delete(TCP_connectionsMap,socket)
		ds_map_delete(UDP_connectionIdMap,socket)
		
		instance_destroy(instance)
		
		break;	
	}
	
	case network_type_data:
	{
		var socket = async_load[? "id"]
				
		var instance = TCP_connectionsMap[? socket]
		
		if (instance != undefined)
		{		
			with(instance)
			{
				var buffer = async_load[? "buffer"]
				
				buffer_seek(buffer,buffer_seek_start,0)
	
				var _header = buffer_read(buffer,buffer_s8)
				
				if _header == global.TCP_INDENTIFER
				{
		
					var packetType = buffer_read(buffer,buffer_s8)
		
					var dataTypeArray = other.packetLayoutMap[? packetType]	
					
					var dataTypeSize = array_length_1d(dataTypeArray)
		
					var unpackedData = []
		
					for(var i = 0; i < dataTypeSize; i++)
					{
						unpackedData[i] = buffer_read(buffer,dataTypeArray[i])
					}
		
					var callback = other.packetCallbackMap[? packetType]
					
					var ip = async_load[? "ip"];
					
					script_execute(callback, socket, unpackedData,ip);
				}
				else
				{
					debug_log("Disregarded packet!, TCP_IDENTIFIER WRONG is " + string(_header))	
				}
			}
		}
		break;	
	}
}