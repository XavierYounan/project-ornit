draw_self()

draw_set_valign(fa_middle)
draw_set_colour(c_black)
draw_text(x,y-40,title)

if (clicked)
{
	draw_text(x, y, message +  cursor); 
}
else
{
	draw_text(x, y, message)
}

draw_set_valign(fa_left)
draw_set_colour(c_white)