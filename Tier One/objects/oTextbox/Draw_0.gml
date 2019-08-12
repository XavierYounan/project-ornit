draw_self()

draw_set_valign(fa_middle)
draw_set_colour(c_black)
draw_text(x,y-40,title)


/*
	draws the error message ten pixels to the right of the title text in red
	Checks to see if there is an error message because changing the draw colour is expensive
*/
if(error_message != "")
{
	draw_set_colour(c_red)
	draw_text(x+string_width(title) + 10, y-40, error_message)
	draw_set_colour(c_black)
}

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