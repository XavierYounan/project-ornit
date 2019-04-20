switch (state)
{
	case RESPAWN_STATE.CLICKABLE:
	{
		switch(buttonState)
		{
			case BUTTON_STATE.CLICKED:
			{
				if (position_meeting(mouse_x,mouse_y,id))
				{
					if (mouse_check_button_released(mb_left))
					{
						buttonState = BUTTON_STATE.NOTHING						
						if (instance_exists(oT2))
						{
							var _T2Id = oT2.m_connectionId

							if (_T2Id = noone)
							{
								show_error("Could not send message to T2, connection id not defined",true)	
							}
							else
							{
								var _packet = gnet_packet_build(PACKET_IDENTIFIER.T1_REQUEST_RESPAWN,mouse_x,mouse_y)
								gnet_packet_send_to_id(_packet,_T2Id)
								
								var localId = undefined
								
								with(oPlayer)
								{
									if isLocal
									{
										localId = m_ClientId
									}
								}
								
								if (localId != undefined)
								{
									packet_tcp_send(_T2Id,TCP_PACKETS.T1_REQUEST_RESPAWN,[localId,mouse_x,mouse_y])
								}
							}
						}
					}
					
				}
				else
				{
					if !(mouse_check_button(mb_left))
					{
						buttonState = BUTTON_STATE.NOTHING
					}
				}
				break;
			}
			
			case BUTTON_STATE.HOVER:
			{
				if (position_meeting(mouse_x,mouse_y,id))
				{
					if (mouse_check_button_pressed(mb_left))
					{
						buttonState = BUTTON_STATE.CLICKED
					}
				}
				else
				{
					buttonState = BUTTON_STATE.NOTHING	
				}
					
				break	
			}
			
			case BUTTON_STATE.NOTHING:
			{			
				if (position_meeting(mouse_x,mouse_y,id))
				{
					if (mouse_check_button_pressed(mb_left))
					{
						buttonState = BUTTON_STATE.CLICKED
					}
					else
					{
						buttonState = BUTTON_STATE.HOVER
					}
				
				}
				break;
			}
		}
		break;	
	}
	
	case RESPAWN_STATE.INACTIVE:
	{
		break;	
	}
}