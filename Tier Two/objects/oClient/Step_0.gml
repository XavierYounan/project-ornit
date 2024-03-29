switch state
{
	case state.dead:
	{	
		#region Dead code		
		var list = global.T1_CONNECTION_ID_LIST
		var _arrSize = array_length_1d(list)
		for(var i = 0; i < _arrSize; i++)
		{
			packet_tcp_send(list[i],TCP_PACKETS.T2_STATE_UPDATE,[m_ClientId,t1state_DEAD])
		}
		#endregion
		break;
	}
	case state.waitingForInfo:
	{
		#region do nothing just wait untill recieve info then state will be set to sending
		
		#endregion
		break;
	}
	
	case state.sendingInfo:
	{
		#region Send info	
		
		with(oClient)
		{	
			if (other.m_ClientId = m_ClientId)
			{				

				packet_tcp_send(m_ClientId,TCP_PACKETS.T2_LOCAL_PLAYER_INFO,[m_ClientId,m_username])

				debug_log("Sent local player info!")
			}
			else
			{				

				packet_tcp_send(other.m_ClientId,TCP_PACKETS.T2_PLAYER_INFO,[m_ClientId,m_username])
				
				packet_tcp_send(m_ClientId,TCP_PACKETS.T2_PLAYER_INFO,[other.m_ClientId,m_username])

				
				switch(state)
				{
					case state.dead:
					{
						packet_tcp_send(other.m_ClientId,TCP_PACKETS.T2_STATE_UPDATE,[m_ClientId,t1state_DEAD])
						break;
					}
					
					case state.playing:
					{
						packet_tcp_send(other.m_ClientId,TCP_PACKETS.T2_PLAYER_RESPAWN,[m_ClientId,character])
						break;
					}
				}
			}
		}
		
		state = state.dead
		debug_log("Made dead, reason: FIN_SENDING_INFO")
		
		#endregion
		break;
	}	
		
	case state.playing:
	{		
		#region Player 
		if (m_framesTillUpdate <= 0)
		{
			switch(character)
			{
				case CHOSEN_CHARACTER.NINJA:
				{
					var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_NINJA, hero.x, hero.y, m_ClientId, mouse_angle, hero.playerState)
					gnet_packet_send_to_list_exclude(_packet, global.T1_CONNECTION_ID_LIST, [m_ClientId])
			
					var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_HEALTH_STUN_UPDATE,m_ClientId,round(hero.hp),hero.stunned,hero.slowed)
					gnet_packet_send_to_list(_packet,global.T1_CONNECTION_ID_LIST)
			
					var packet = gnet_packet_build(PACKET_IDENTIFIER.T2_NINJA_LOCAL,hero.x,hero.y,m_ClientId,m_lastProcessedImput[2],hero.hsp,hero.vsp, hero.playerState)
					gnet_packet_send_to_id(packet,m_ClientId)
					break;
				}
				
				case CHOSEN_CHARACTER.MAGNET_BOI:
				{
					var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_MAGNET_BOI, hero.x, hero.y, m_ClientId, mouse_angle, hero.playerState)
					gnet_packet_send_to_list_exclude(_packet, global.T1_CONNECTION_ID_LIST, [m_ClientId])
			
					var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_HEALTH_STUN_UPDATE,m_ClientId,round(hero.hp),hero.stunned,hero.slowed)
					gnet_packet_send_to_list(_packet,global.T1_CONNECTION_ID_LIST)
			
					var packet = gnet_packet_build(PACKET_IDENTIFIER.T2_MAGNET_BOI_LOCAL,hero.x,hero.y,m_ClientId,m_lastProcessedImput[2],hero.hsp,hero.vsp, hero.playerState)
					gnet_packet_send_to_id(packet,m_ClientId)
					break;
				}
				
				case CHOSEN_CHARACTER.NULL:
				{
					debug_log("Cannot send position update because oClient doesnt know which character has been chosen",2)
					break;
					
				}
				
				default: debug_log("Character is in default, FIX THIS!")
				
			}
			
			m_framesTillUpdate = m_updateFrequencyFrames + 1;
		}
		else
		{
			//f_ConsoleAddMessage("Not the right frame " + string(m_framesTillUpdate) + ":" + string(m_updateFrequencyFrames))
		}
		
		m_framesTillUpdate --;

		#endregion
		break;
	}
	
	default: debug_log("oClient is in default FIX THIS",2)
}
#region //Server send time for individual client

if (m_updatePing = true)
{
	m_updatePing = false;
	var _time = current_time + floor(m_roundTripTime/2) //floor because faster as when dividing by 2  will always be rounded down (.0 or .5)
	var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_SEND_TIME,_time)
	gnet_packet_send_to_id(_packet,m_ClientId)
}
#endregion