var listSize = ds_list_size(to_send_list)

for (var i = 0; i < listSize; i++)
{
	var buff = buffer_create(256,buffer_grow,1)
	
	buffer_seek(buff,buffer_seek_start,0)
	
	buffer_write(buff,buffer_s8,global.TCP_INDENTIFER)

	var arr =  to_send_list[| i];
	
	var packetType = arr[0]
	var dataTypeArray = TCP_manager.packetLayoutMap[? packetType]
	var dataTypeLength = array_length_1d(dataTypeArray)
	
	var information = arr[1]
	var informationLength = array_length_1d(information)
	
	if dataTypeLength == informationLength
	{
		buffer_write(buff,buffer_u8,packetType) //add the packet type header
		
		for( var index = 0; index < informationLength; index++)
		{
			buffer_write(buff,dataTypeArray[index],	information[index]) // add the data
		}
	}
	else
	{
		show_error("Too much or too little info was supplied when sending a TCP packet, packet id of " + string(packetType),true)	
	}
	
	network_send_packet(socket,buff,buffer_tell(buff))

	buffer_delete(buff)
}

ds_list_clear(to_send_list)
