switch managerState
{
	case SENDINGINFO:
	{
		#region //every 1 seccond send packet identifiers
		m_timeLeft --
		
		if (m_timeLeft <= 0)
		{
			m_timeLeft = m_repeatFrequency
			m_repeatLeft --
			
			
			if (instance_exists(oT2))
			{
				var _T2Id = oT2.m_connectionId

				if (_T2Id = noone)
				{
					show_error("Could not send message to T2, connection id not defined",true)	
				}
				else
				{
					var packet = gnet_packet_build(PACKET_IDENTIFIER.T1_SELF_PLAYER_INFO,m_username,m_character)
					gnet_packet_send_to_id(packet,_T2Id)
				}
			}		

			
			if (m_repeatLeft <=0)
			{
				fConsoleAddMessage("Never Recieved Updated Self Info")
				managerState = ERROR
			}	
		}
		#endregion
		break;
	}
	
	case PLAYING:
	{
		#region //send imputs
		var _keyUp = keyboard_check(ord("W"))
		var _keyDown = keyboard_check(ord("S"))
		var _keyLeft = keyboard_check(ord("A"))
		var _keyRight = keyboard_check(ord("D"))

		var _hsp = _keyRight - _keyLeft
		var _vsp = _keyUp - _keyDown

		var _mouseLeftClicked = mouse_check_button(mb_left)
	
		if (instance_exists(oT2))
		{
			var _T2Id = oT2.m_connectionId

			if (_T2Id = noone)
			{
				show_error("Could not send message to T2, connection id not defined",true)	
			}
			else
			{
				var _gunAngle = round(m_gunAngle)
				var _packet = gnet_packet_build(PACKET_IDENTIFIER.T1_KEYS,_hsp,_vsp,oServerTime.m_serverTime,mouse_x,mouse_y,_mouseLeftClicked);
				gnet_packet_send_to_id(_packet,_T2Id);
				m_unreadImputs = fArrayMoveBack(m_unreadImputs,1);
				m_unreadImputs[0] = [_hsp,_vsp,oServerTime.m_serverTime,_gunAngle];
			}
		}
		else
		{
			fConsoleAddMessage("T2 is dead : " + string(oServerTime.m_serverTime))
		}

		#endregion 
		break;
	}
	
}

