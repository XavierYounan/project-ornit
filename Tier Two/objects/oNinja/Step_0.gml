//ninja
State = parentId.state

switch(State)
{
	case state.playing:
	{
		#region Playing code		
		#region Loop through and apply imputs
		var _arraySize = array_length_1d(m_imputLog)
		
		/*
		var file;
		file = file_text_open_append(working_directory + "deltaTimes.txt");
		file_text_write_string(file, string(current_hour) + ":" + string(current_minute) + ":" + string(current_second) + ": processing unread imputs, length is " + string(_arraySize) + "\r\n");
		file_text_close(file);
		*/
		
		for (var i = _arraySize - 1; i >= 0; i--)
		{			
			ninjaMovePlayer(id,m_imputLog[i]);	
		}
		
		#endregion
			
		if (hp <= 0)
		{
			parentId.state = state.dead
			debug_log("Made dead, reason: HP_EQUAL_ZERO")
			
			var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_HEALTH_STUN_UPDATE,parentClientId,0,0,0)
			gnet_packet_send_to_list(_packet,global.T1_CONNECTION_ID_LIST)
			
			instance_destroy(self)
		}
		
		#region //clear imput log
		
		if (_arraySize > 0)
		{	
			parentId.m_lastProcessedImput = m_imputLog[0]
			m_imputLog = []
		}
		
		#endregion
		
		#endregion
		break;	
	}
}
