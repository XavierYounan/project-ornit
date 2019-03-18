/// @description Init 
switch controllerState
{
	case controllerState.normal:
	{
		var _listSize = ds_list_size(m_messageList);
		var _yAnchor = window_get_height() - 10; //CHANGE TO VARIABLE PIXELS FROM LEFT
		var _spacing = 30; //CHANGE TO FONT HEIGHT PLUS GAP

		draw_set_colour(c_white)
		for (var i = _listSize - 1; i > -1; i--)
		{
			draw_set_alpha(1 - ((_listSize - i - 1)/m_maxMessages))
			draw_text(10, _yAnchor - ((_listSize - i) * _spacing), m_messageList[| i]);
		}
		draw_set_alpha(1)
		
		if (keyboard_check_pressed(vk_enter))
		{
			controllerState = controllerState.typing
			keyboard_string = m_string
		}
		break;	
	}
	
	case controllerState.typing:
	{		
		var _yAnchor = window_get_height() - 20; //CHANGE TO VARIABLE PIXELS FROM LEFT
		var _spacing = 30; //CHANGE TO FONT HEIGHT PLUS GAP
		
		draw_text(10,_yAnchor,keyboard_string)
		
		if (keyboard_check_pressed(vk_enter))
		{
			controllerState = controllerState.normal
			f_ConsoleAddMessage(string(runCommand(keyboard_string)))
			m_string = ""
		}
		
		if (keyboard_check_pressed(vk_escape))
		{
			controllerState = controllerState.normal	
			m_string = keyboard_string
		}
		
		break;
	}
}

