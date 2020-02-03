global.developer_mode = true

instance_create_depth(-10,-10,DEPTH.GUI,oDebug) //Fix depth later

// quickly get the player to accept permisions if the havent before by starting then closing a network


//Make sure network can be created, get past firewall before connecting
gnet_start_network(1,PROTOCOL_ID,3111, "temp connection") 
gnet_stop_network()


room_goto_next()