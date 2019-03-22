speed = 15
hitDelay = 5
image_speed = 0

with(DebugHud)
{
	if( debugMode == DEBUG_MODES.HITBOXES)
	{
		other.image_index = 1
	}
	else
	{
		other.image_index = 0	
	}
}



