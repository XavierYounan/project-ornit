//This is used to easily restart server, it makes it easier to debug
with(oClient)
{
	hp = 100	
	
	var list = global.T1_CONNECTION_ID_LIST
	var _arrSize = array_length_1d(list)
	for(var i = 0; i < _arrSize; i++)
	{
		packet_tcp_send(list[i],TCP_PACKETS.T2_STATE_UPDATE,[m_ClientId,t1state_PLAYING])
	}

	state = state.playing
}


