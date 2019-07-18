if (!assert_singleton()) return;

packetLayoutMap = ds_map_create()
packetCallbackMap = ds_map_create()

eventNotificationCallbackMap = ds_map_create()

packet_types() //init the different packet types

global.TCP_INDENTIFER = 69 

global.T2_TCP_socket = network_create_socket(network_socket_tcp);
network_connect(global.T2_TCP_socket,global.IP,global.PORT + 2);

var instance = instance_create_depth(0,0,0,TCP_connection)
instance.socket = global.T2_TCP_socket

socket_instance_map = ds_map_create()
ds_map_add(socket_instance_map,global.T2_TCP_socket,instance)