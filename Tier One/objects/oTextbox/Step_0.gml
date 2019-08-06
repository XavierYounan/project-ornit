if(position_meeting(mouse_x,mouse_y,id))
{
	if(mouse_check_button_released(mb_left))
	{
		if(clicked = false)
		{
			//clicked = true
			clicked = true
			image_index = 1
			keyboard_string = message
		}
	}	
}	
else
{
	if(mouse_check_button_released(mb_left))
	{
		if(clicked = true)
		{
			//clicked = false
			clicked = false
			image_index = 0
			keyboard_string = ""
		}
	}	
}

if(clicked)
{
	if (string_width(keyboard_string) < sprite_width - pixelWidth)
	{
		message = keyboard_string
	}
	else
	{
		keyboard_string = message
	}
}
