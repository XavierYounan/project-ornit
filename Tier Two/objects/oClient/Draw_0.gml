draw_set_colour(c_white)
switch (state)
{	
	case state.playing:
	{
		draw_text(x,y,"Playing")
		break;
	}
}

draw_self();


draw_text(10,10,string(m_roundTripTime))

