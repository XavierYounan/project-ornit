//This is used to easily restart server, it makes it easier to debug
with(oClient)
{
	hp = 100	
	var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_STATE_UPDATE,m_ClientId,0)
	gnet_packet_send_to_list(_packet,global.T1_CONNECTION_ID_LIST)
	state = state.playing
}


