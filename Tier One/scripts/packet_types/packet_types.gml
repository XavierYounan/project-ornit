enum TCP_PACKETS
{
	T1_INFO,
	T2_PLAYER_DISCONNECT
}

TCP_packet_type_create(TCP_PACKETS.T1_INFO,tcp_cb_T1_Info,buffer_string,buffer_u8)
TCP_packet_type_create(TCP_PACKETS.T2_PLAYER_DISCONNECT,tcp_cb_T2_PlayerDisconnect,buffer_u8)