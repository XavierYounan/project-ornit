if (!assert_singleton()) return;
	
TCP_connectionsMap = ds_map_create()

TCP_socket = network_create_socket(network_socket_tcp);
network_connect(TCP_socket,global.IP,global.PORT + 2);

packetLayoutMap = ds_map_create()
packetCallbackMap = ds_map_create()

packet_types() //init the different packet types

global.TCP_INDENTIFER = 69 