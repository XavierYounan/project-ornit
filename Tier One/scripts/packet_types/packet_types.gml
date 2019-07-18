enum TCP_PACKETS
{
	T1_INFO,
	T2_PLAYER_DISCONNECT,
	T2_LOCAL_PLAYER_INFO,
	T2_PLAYER_INFO,
	T2_STATE_UPDATE,
	T1_REQUEST_RESPAWN,
	T2_PLAYER_RESPAWN,
	T2_HERO_STATE_UPDATE,
	T2_EVENT_NOTIFICATION,
}


TCP_packet_type_create(TCP_PACKETS.T2_PLAYER_DISCONNECT,tcp_cb_T2_PlayerDisconnect,buffer_u8)
TCP_packet_type_create(TCP_PACKETS.T1_INFO,tcp_cb_T1_Info,buffer_u16,buffer_string)
TCP_packet_type_create(TCP_PACKETS.T2_LOCAL_PLAYER_INFO,tcp_cb_T2_LocalPlayerInfo,buffer_u8,buffer_u8,buffer_string)
TCP_packet_type_create(TCP_PACKETS.T2_PLAYER_INFO,tcp_cb_T2_PlayerInfo,buffer_u8,buffer_u8,buffer_string)
TCP_packet_type_create(TCP_PACKETS.T2_STATE_UPDATE,tcp_cb_T2_StateUpdate,buffer_u8,buffer_u8)
TCP_packet_type_create(TCP_PACKETS.T2_HERO_STATE_UPDATE,tcp_cb_T2_HeroStateUpdate,buffer_u8,buffer_u8)
TCP_packet_type_create(TCP_PACKETS.T1_REQUEST_RESPAWN,tcp_cb_T1_RequestRespawn,buffer_u8,buffer_u32,buffer_u32)
TCP_packet_type_create(TCP_PACKETS.T2_PLAYER_RESPAWN,tcp_cb_T2_PlayerRespawn,buffer_u8,buffer_u8)

TCP_packet_type_create(TCP_PACKETS.T2_EVENT_NOTIFICATION, tcp_cb_T2_EventNotification, buffer_u8, buffer_u8)
eventNotificationCreate(EVENT_NOTIFICATION.MAGNET_BOI_ATTACK_SLASH, evnt_noti_magnetBoiAttackSlash)
eventNotificationCreate(EVENT_NOTIFICATION.MAGNET_BOI_ATTACK_COMBO, evnt_noti_magnetBoiAttackCombo)
