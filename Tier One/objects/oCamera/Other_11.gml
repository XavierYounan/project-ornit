/// @desc Follow the player
//check local isnt undefined
if localPlayer == id
{
	event_user(CAMERA_EVENT.FULL_SCREEN)
	fConsoleAddMessage("Coldnt follow the player, no local player has been set (camera)")
}
		
//check hero isnt undefined
if localPlayer.hero == null
{
	event_user(CAMERA_EVENT.FULL_SCREEN)
	fConsoleAddMessage("Coldnt follow the player, no player to follow")
	
}
		
//change projection to zoom in
cameraWidth = 1920;
cameraHeight = 1080;
var pm = matrix_build_projection_ortho(cameraWidth,cameraHeight,0,lookDistance);
camera_set_proj_mat(camera,pm);
		
x = localPlayer.hero.x;
y = localPlayer.hero.y;
		
//Dont let it go outside
x = clamp(x,xResolution/2,room_width - xResolution/2);
y = clamp(y,yResolution/2,room_height - yResolution/2);
		
with (oRespawn)
{
	state = RESPAWN_STATE.INACTIVE;
	buttonState = BUTTON_STATE.NOTHING;
}
			
		
//Set the state
state = CAMERA_STATE.FOLLOW_PLAYER;

fConsoleAddMessage("User event follow a player has been triggred")