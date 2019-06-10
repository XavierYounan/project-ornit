///@desc Show the whole screen

if (state != CAMERA_STATE.SHOW_FULL_MAP)
{
	state = CAMERA_STATE.SHOW_FULL_MAP	
		
	with (oRespawn)
	{
		state = RESPAWN_STATE.CLICKABLE
	}

	fConsoleAddMessage("User event show the whole screen has been triggred")
}
