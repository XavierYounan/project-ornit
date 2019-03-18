draw_set_colour(c_white)
switch (state)
{	
	case state.playing:
	{
		draw_text(x,y,"Playing")
		break;
	}
}

draw_text(10,10,string(m_roundTripTime))

draw_healthbar(x - 50,y - 100,x+50,y - 90,hp,c_black,c_red,c_green,0,true,true)
draw_text(x-60,y-100,"ID IS " + string(m_ClientId))
