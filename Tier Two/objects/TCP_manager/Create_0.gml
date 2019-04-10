if (!assert_singleton()) return;
	
TCP_connectionsMap = ds_map_create()

packetLayoutMap = ds_map_create()
packetCallbackMap = ds_map_create()

packet_types() //init the different packet types