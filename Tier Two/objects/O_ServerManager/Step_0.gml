play = keyboard_check(ord("P"))

if (play)
{
	room_goto(r_Play)
	
	with (oClient)
	{
		state = state.playing	
	}
	var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_READY_UP,true)
	gnet_packet_send_all(_packet)	
}

