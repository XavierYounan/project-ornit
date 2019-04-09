if (!assert_singleton()) return;

TCP_connectionsMap = ds_map_create()

server = network_create_server(network_socket_tcp, port, global.MAX_PLAYERS);
while (server < 0 && port < 65535)
   {
   port++
   server = network_create_server(network_socket_tcp, port, global.MAX_PLAYERS);
   }

TCP_socket = network_create_socket(network_socket_tcp);
network_connect(TCP_socket,global.IP,global.PORT + 1);

packetLayoutMap = ds_map_create()
packetCallbackMap = ds_map_create()

packet_types() //init the different packet types