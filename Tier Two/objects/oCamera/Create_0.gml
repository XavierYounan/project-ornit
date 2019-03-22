veiwRefershTime = room_speed * 5 //update every ten secconds

//Enable the use of views
view_enabled = true;

//Make view 0 visible
view_set_visible(0, true);

//Set the port bounds of view 0 to resoultion
view_set_wport(0, room_width);
view_set_hport(0, room_height);

//Resize and center
window_set_rectangle((display_get_width() - view_wport[0]) * 0.5, (display_get_height() - view_hport[0]) * 0.5, view_wport[0], view_hport[0]);
surface_resize(application_surface,view_wport[0],view_hport[0]);

camera = camera_create();

depthMin = -1000
lookDistance = 100000

tabBuffer = 100

var vm = matrix_build_lookat(x,y,depthMin,x,y,0,false,true,false);
var pm = matrix_build_projection_ortho(room_width,room_height,0,lookDistance);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

alarm[0] = veiwRefershTime;

f_ConsoleAddMessage("Created")