/// @description Player died
instance_destroy(hero)
hero = null

with(oCamera)
{
	event_user(CAMERA_EVENT.FULL_SCREEN)	
}

event_user(PLAYER_STATE.DEAD)
