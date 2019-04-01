/// @description Init 

if (displayingText)
{
	var _listSize = array_length_1d(m_droppedPacketList);
	var _yAnchor = window_get_height() - 10; //CHANGE TO VARIABLE PIXELS FROM LEFT
	var _spacing = 30; //CHANGE TO FONT HEIGHT PLUS GAP

	draw_set_colour(c_white)
	for (var i = _listSize - 1; i > -1; i--)
	{
		draw_set_alpha(1 - ((_listSize - i - 1)/m_maxMessages))
		draw_text(10, _yAnchor - ((_listSize - i) * _spacing), m_droppedPacketList[i]);
	
	}
	draw_set_alpha(1)
}