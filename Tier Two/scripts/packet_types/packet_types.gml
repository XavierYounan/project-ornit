enum TCP_PACKETS
{
	T1_INFO,
	T2_PLAYER_DISCONNECT,
	T2_PLAYER_CONNECT,
	T2_LOCAL_PLAYER_INFO,
	T2_PLAYER_INFO
}

TCP_packet_type_create(TCP_PACKETS.T1_INFO,tcp_cb_T1_Info,buffer_string,buffer_u8)
TCP_packet_type_create(TCP_PACKETS.T2_PLAYER_DISCONNECT,tcp_cb_T2_PlayerDisconnect,buffer_u8)
TCP_packet_type_create(TCP_PACKETS.T2_PLAYER_CONNECT,tcp_cb_T2_PlayerConnect,buffer_u8)
TCP_packet_type_create(TCP_PACKETS.T2_LOCAL_PLAYER_INFO,tcp_cb_T2_LocalPlayerInfo
TCP_packet_type_create(TCP_PACKETS.T2_PLAYER_INFO,tcp_cb_T2_PlayerInfo

gnet_packet_layout_create(PACKET_IDENTIFIER.T2_PLAYER_INFO,cb_T2_PlayerInfo,buffer_u8,buffer_u8,buffer_string)
gnet_packet_layout_create(PACKET_IDENTIFIER.T2_LOCAL_PLAYER_INFO,cb_T2_LocalPlayerInfo,buffer_u8,buffer_u8,buffer_string)