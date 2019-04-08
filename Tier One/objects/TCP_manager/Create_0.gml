if (!assert_singleton()) return;

TCP_connection = network_create_socket(network_socket_tcp);
network_connect(TCP_connection,global.IP,global.PORT + 1);

buff = buffer_create(256,buffer_grow,1)

toSendList = ds_list_create()

packetLayoutMap = ds_map_create()
packetCallbackMap = ds_map_create()

packet_types() //init the different packet types