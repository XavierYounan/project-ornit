enum TCP_PACKETS
{
	T1_INFO,
	HANDSHAKE
}

TCP_packet_type_create(TCP_PACKETS.T1_INFO,tcp_cb_T1_Info,buffer_string,buffer_u8)
TCP_packet_type_create(TCP_PACKETS.HANDSHAKE,tcp_cb_T1_Handshake,buffer_u16)