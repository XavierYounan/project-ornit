/// @description Clean Up

if (variable_global_exists("gnet_mySocket"))
{
	var p = gnet_packet_build(Gnet_PacketId.disconnect);
	gnet_packet_send_all(p);
	buffer_delete(p);
}

with (Connection)       { instance_destroy(); }
with (DebugHud)         { instance_destroy(); }
with (FunctionRepeater) { instance_destroy(); }
log_debug("FunctionRepeater has been destroyed!")

//with (DebugHud)			{ instance_destroy(); } DUPLICATE??

ds_map_destroy(m_connectionMap);
ds_map_destroy(m_packetLayoutMap);
ds_map_destroy(global.GNET_PACKET_ID_NAMES);

if (variable_global_exists("gnet_mySocket"))
	network_destroy(global.gnet_mySocket);


gnet_OnNetworkShutdown();