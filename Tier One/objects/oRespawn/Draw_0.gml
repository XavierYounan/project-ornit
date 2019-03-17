switch (state)
{
	case RESPAWN_STATE.CLICKABLE:
	{
		draw_rectangle_colour(x, y, x+ rWidth, y+ rHeight, colours[buttonState], colours[buttonState], colours[buttonState], colours[buttonState], false)
		break;	
	}
	
	case RESPAWN_STATE.INACTIVE:
	{
		
		break;	
	}
}