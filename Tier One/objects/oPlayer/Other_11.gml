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
		fConsoleAddMessage("Recieved state update of dead and player is local, making camera full screen",2)
	}
}

playerState = PLAYER_STATE.DEAD
