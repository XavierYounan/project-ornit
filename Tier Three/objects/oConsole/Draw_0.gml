/// @description Init 

var _listSize = ds_list_size(m_messageList);
var _yAnchor = window_get_height() - 10; //CHANGE TO VARIABLE PIXELS FROM LEFT
var _spacing = 30; //CHANGE TO FONT HEIGHT PLUS GAP

draw_set_colour(c_white)
draw_set_alpha(1)
for (var i = _listSize - 1; i > -1; i--)
{
	draw_text(10, _yAnchor - ((_listSize - i) * _spacing), m_messageList[| i]);
	
}
draw_set_alpha(1)