camera = camera_create();

depthMin = -1000
lookDistance = 100000

xResolution = 1024
xResolution = 1024
 
var vm = matrix_build_lookat(x,y,depthMin,x,y,0,false,true,false);
var pm = matrix_build_projection_ortho(xResolution,xResolution,0,lookDistance);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

enum CAMERA_STATE
{
	FOLLOW_PLAYER,
	FOLLOW_PLAYER_CREATE,
	SHOW_FULL_MAP
}

state = CAMERA_STATE.FOLLOW_PLAYER

localPlayer = noone;

xTo = x
yTo = y