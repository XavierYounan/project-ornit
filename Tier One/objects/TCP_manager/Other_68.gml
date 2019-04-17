var socket = async_load[? "id"]

if socket == global.T2_TCP_socket
{
	
	var buffer = async_load[? "buffer"]
	
	var _header = buffer_read(buffer,buffer_s8)
				
	if _header == global.TCP_INDENTIFER
	{
		
		var packetType = buffer_read(buffer,buffer_s8)
		
		var dataTypeArray = packetLayoutMap[? packetType]	
		var dataTypeSize = array_length_1d(dataTypeArray)
		
		var unpackedData = []
		
		for(var i = 0; i < dataTypeSize; i++)
		{
			unpackedData[i] = buffer_read(buffer,dataTypeSize[i])
		}
		
		var callback = packetCallbackMap[? packetType]					

		script_execute(callback,unpackedData);
	}
}