switch (state)
{
	case RESPAWN_STATE.CLICKABLE:
	{
		switch(buttonState)
		{
			case BUTTON_STATE.CLICKED:
			{
				fConsoleAddMessage("State is clicked")

				if (position_meeting(mouse_x,mouse_y,id))
				{
					if (mouse_check_button_released(mb_left))
					{
						fConsoleAddMessage("CLICKED RESPAWN")
						buttonState = BUTTON_STATE.NOTHING
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
				fConsoleAddMessage("STATE IS HOVERED")

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
				fConsoleAddMessage("STATE IS NOTHING")

				
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
		fConsoleAddMessage("STATE IS INACTIVE")
		break;	
	}
}