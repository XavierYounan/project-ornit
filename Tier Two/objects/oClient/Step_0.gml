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
		//do nothing just wait untill recieve info then state will be set to sending

		break;
	}
	
	case state.sendingInfo:
	{
		#region Send info	
		
		with(oClient)
		{
			
			if (other.m_ClientId = m_ClientId)
			{				
				packet_tcp_send(m_ClientId,TCP_PACKETS.T2_LOCAL_PLAYER_INFO,[m_ClientId,m_character,m_username])
				f_ConsoleAddMessage("Sent local player info!")
			}
			else
			{				
				packet_tcp_send(other.m_ClientId,TCP_PACKETS.T2_PLAYER_INFO,[m_ClientId,m_character,m_username])
				f_ConsoleAddMessage("Sent player info!")
				
				packet_tcp_send(m_ClientId,TCP_PACKETS.T2_PLAYER_INFO,[other.m_ClientId,other.m_character,other.m_username])
				f_ConsoleAddMessage("Sent player info!")
			}
		}
		
		state = state.dead
		
		#endregion
		break;
	}	
		
	case state.playing:
	{		
		if (m_framesTillUpdate <= 0)
		{
			var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_OTHER_POSITION, x, y, m_ClientId, hero.itemList[NINJA_ITEMS.GUN].image_angle)
			gnet_packet_send_to_list_exclude(_packet, global.T1_CONNECTION_ID_LIST, [m_ClientId])
			
			var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_HEALTH_UPDATE,m_ClientId,round(hero.hp))
			gnet_packet_send_to_list(_packet,global.T1_CONNECTION_ID_LIST)
			
			var packet = gnet_packet_build(PACKET_IDENTIFIER.T2_SELF_POSITION,x,y,m_ClientId,m_lastProcessedImput[2],hero.hsp,hero.vsp)
			gnet_packet_send_to_id(packet,m_ClientId)
			
			m_framesTillUpdate = m_updateFrequencyFrames + 1
		}
		else
		{
			//f_ConsoleAddMessage("Not the right frame " + string(m_framesTillUpdate) + ":" + string(m_updateFrequencyFrames))
		}
		
		m_framesTillUpdate --;

		break;
	}
	
	default:
	{
		f_ConsoleAddMessage("oClient is in default FIX THIS")
		break;
	}
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


