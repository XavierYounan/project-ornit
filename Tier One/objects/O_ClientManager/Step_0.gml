switch managerState
{
	case SENDINGINFO:
	{
		if sent_tcp_info == false
		{
			packet_tcp_send(global.T2_TCP_socket,TCP_PACKETS.T1_INFO,[global.gnet_myPort,m_username,m_character])
			sent_tcp_info = true;
		}
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
				var deltaTime = global.dt_unsteady
				var dt = clamp(deltaTime,0,4294967295)
				
				if (dt != deltaTime)
				{
					fConsoleAddMessage("clamped:not clamped " + string(dt) + ":" + string(deltaTime))	
				}
				var _packet = gnet_packet_build(PACKET_IDENTIFIER.T1_KEYS,_hsp,_vsp,packet_number,mouse_x,mouse_y,_mouseLeftClicked,deltaTime);
				gnet_packet_send_to_id(_packet,_T2Id);
				
				packet_number ++
				m_unreadImputs = fArrayMoveBack(m_unreadImputs,1);
				m_unreadImputs[0] = [_hsp,_vsp,packet_number,_gunAngle,deltaTime];
				
				
				with(global.predictionTest)
				{
					m_unreadImputs = fArrayMoveBack(m_unreadImputs,1);
					m_unreadImputs[0] = [_hsp,_vsp,other.packet_number,_gunAngle,deltaTime];	
				}
				
				return;
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

fConsoleAddMessage("Didnt send imputs")