/// @description Init 

if (displayingText)
{
	var _listSize = ds_list_size(m_messageList);
	var _yAnchor = window_get_height() - 10; //CHANGE TO VARIABLE PIXELS FROM LEFT
	var _spacing = 30; //CHANGE TO FONT HEIGHT PLUS GAP

	draw_set_colour(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_center)
	draw_set_alpha(1)
	for (var i = _listSize - 1; i > -1; i--)
	{
		//draw_set_alpha(1 - ((_listSize - i - 1)/m_maxMessages))
		draw_text(10, _yAnchor - ((_listSize - i) * _spacing), m_messageList[| i]);
	
	}
	//draw_set_alpha(1)
}