var socket = async_load[? "id"]

//save the async load
ds_map_secure_save(async_load, "async_load.txt");


if socket == global.T2_TCP_socket
{
	
	var buffer = async_load[? "buffer"]
	buffer_seek(buffer,buffer_seek_start,0)
	
	var _header = buffer_read(buffer,buffer_s8)
				
	if _header == global.TCP_INDENTIFER
	{
		
		var packetType = buffer_read(buffer,buffer_s8)
		
		var dataTypeArray = packetLayoutMap[? packetType]
		
		var dataTypeSize = array_length_1d(dataTypeArray)
		
		var unpackedData = []
		
		for(var i = 0; i < dataTypeSize; i++)
		{
			unpackedData[i] = buffer_read(buffer,dataTypeArray[i])
		}
		
		var callback = packetCallbackMap[? packetType]

		script_execute(callback,unpackedData);
	}
	else
	{
		fConsoleAddMessage("TCP_identifier is wrong! Header is " + string(_header))
	}
}
else
{
	fConsoleAddMessage("Socket is wrong! Socket is " +  string(socket) + " Global socket should be " + string(global.T2_TCP_socket))
}