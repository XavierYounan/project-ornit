//Enable the use of views
view_enabled = true;

//Set the resolution
xResolution = display_get_width()/2
yResolution = display_get_height()/2

cameraWidth = xResolution

//Make view 0 visible
view_set_visible(0, true);

//Set the port bounds of view 0 to resoultion
view_set_wport(0, xResolution);
view_set_hport(0, yResolution);

//Resize and center
window_set_rectangle((display_get_width() - view_wport[0]) * 0.5, (display_get_height() - view_hport[0]) * 0.5, view_wport[0], view_hport[0]);
surface_resize(application_surface,view_wport[0],view_hport[0]);

camera = camera_create();

depthMin = -1000
lookDistance = 100000

cameraWidth = xResolution
cameraHeight = xResolution
 
var vm = matrix_build_lookat(x,y,depthMin,x,y,0,false,true,false);
var pm = matrix_build_projection_ortho(cameraWidth,cameraHeight,0,lookDistance);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

enum CAMERA_STATE
{
	FOLLOW_PLAYER,
	SHOW_FULL_MAP,
}

enum CAMERA_EVENT
{
	FULL_SCREEN,
	FOLLOW_PLAYER
}

localPlayer = noone;

xTo = x
yTo = y

localPlayer = id
localPlayer.hero = undefined

state = undefined
event_user(CAMERA_EVENT.FULL_SCREEN)