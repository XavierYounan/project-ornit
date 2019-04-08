if (argument_count < 2)
{
	show_error("TCP_packet_type_create() needs to have at least 2 parameters defining its PacketType and callback script.",true);
	return;
}

if (ds_map_exists(TCP_manager.packetLayoutMap, argument[0])) 
{
	show_error("The data layout cannot be re-registered, it has already been done for packetType " + argument[0], true);	
	return;
}

// Return empty array if there is no data to be sent with this message
if (argument_count == 2)
{
	ds_map_add(TCP_manager.packetLayoutMap, argument[0], []);
	ds_map_add(TCP_manager.packetCallbackMap, argument[0], argument[1]);
	return [];
}

// If there is data we need to build the array
var _array = array_create(argument_count - 2);

for (var _i = 0; _i < argument_count - 2; _i++)
{
	_array[_i] = argument[_i + 2];
}

ds_map_add(TCP_manager.m_packetLayoutMap, argument[0], _array);
ds_map_add(TCP_manager.m_packetCallbackMap, argument[0], argument[1]);	// Holds script to be executed

return _array;