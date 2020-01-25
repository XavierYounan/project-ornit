if (displayingText)
{
	
	tempList = ds_list_create()

	//Make a tempoary list to remove all the messages below the debug level
	for(var i = 0; i < ds_list_size(m_messageList); i++)
	{
		var array = m_messageList[| i]
		var level = array[ConsoleArray.Level]
	
		if(level <= display_level)
		{
			ds_list_add(tempList,array)
		}	
	}

	

	var _listSize = ds_list_size(tempList);
	var _yAnchor = window_get_height() - 10; //CHANGE TO VARIABLE PIXELS FROM LEFT
	var _spacing = 30; //CHANGE TO FONT HEIGHT PLUS GAP

	
	draw_set_halign(fa_left)
	draw_set_valign(fa_center)
	draw_set_alpha(1)
	
	for (var i = _listSize - 1; i > -1; i--)
	{
		var array = tempList[| i]
		
		//set colour based on level
		var level = array[ConsoleArray.Level]
		var colour = errorColours[? level]
		draw_set_color(colour)
		
		var message = array[ConsoleArray.Message]
		
		draw_text(10, _yAnchor - ((_listSize - i) * _spacing), message);
	}
	
	
	ds_list_destroy(tempList)

}