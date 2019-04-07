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
				var deltaTime = global.dt_steady
				var _packet = gnet_packet_build(PACKET_IDENTIFIER.T1_KEYS,_hsp,_vsp,packet_number,mouse_x,mouse_y,_mouseLeftClicked,deltaTime);
				gnet_packet_send_to_id(_packet,_T2Id);
				
				var _str = string_build("Sent T1 Keys away : {} {} {} {} {} {} {}",_hsp,_vsp,packet_number,mouse_x,mouse_y,_mouseLeftClicked,deltaTime)
				
				var _PacketErrorsFile
				_PacketErrorsFile =  file_text_open_write(working_directory + "\packetErrors.txt");
				file_text_write_string(_PacketErrorsFile,_str +  "/n/r/n/r")
				file_text_close(_PacketErrorsFile);
				
				packet_number ++
				m_unreadImputs = fArrayMoveBack(m_unreadImputs,1);
				m_unreadImputs[0] = [_hsp,_vsp,packet_number,_gunAngle,deltaTime];
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

