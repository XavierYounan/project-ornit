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
			
						var localId = undefined
								
						debug_log("There are " + string(instance_number(TCP_connection)) + " many instances", ERROR_LEVEL.DEBUG)
								
						with(oPlayer)
						{
							if isLocal
							{
								localId = m_PlayerId
								debug_log("local", ERROR_LEVEL.INFO)
							}
							else
							{
								debug_log("not local", ERROR_LEVEL.INFO)
							}
						}
								
						if (localId != undefined)
						{
							//save mouse positions so they can move the mouse to enter in character
							var mouseX = mouse_x
							var mouseY = mouse_y
							
							var character = get_string("1: Ninja, 2: Magnet Boi if you type it wrong you will get an error NO SPACES","1")
							character = int64(character)
							
							packet_tcp_send(global.T2_TCP_socket,TCP_PACKETS.T1_REQUEST_RESPAWN,[character,mouseX,mouseY])
							debug_log("Sent request respawn", ERROR_LEVEL.INFO)
						}	
						else
						{
							debug_log("Local id is undefined, cant respawn", ERROR_LEVEL.WARNING)
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