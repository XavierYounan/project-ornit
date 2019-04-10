if (!assert_singleton()) return;
	
TCP_connectionsMap = ds_map_create()

global.T2_TCP_socket = network_create_socket(network_socket_tcp);
network_connect(global.T2_TCP_socket,global.IP,global.PORT + 2);

packetLayoutMap = ds_map_create()
packetCallbackMap = ds_map_create()

packet_types() //init the different packet types

global.TCP_INDENTIFER = 69 

var instance = instance_create_depth(0,0,0,TCP_connection)
ds_map_add(TCP_connectionsMap,T2_TCP_socket,instance)