/// @description Player died
if (hero != undefined)
{
	instance_destroy(hero)
	hero = undefined
}

if (isLocal)
{
	with(oCamera)
	{	
		event_user(CAMERA_EVENT.FULL_SCREEN)
		debug_log("Recieved state update of dead and player is local, making camera full screen",ERROR_LEVEL.SPAM, 2)
	}
}

playerState = PLAYER_STATE.DEAD
