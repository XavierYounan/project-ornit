/// @description Update the camera every time the room changes

//Set the port bounds of view 0 to resoultion
view_set_wport(0, room_width);
view_set_hport(0, room_height);

//Resize and center
window_set_rectangle(tabBuffer,tabBuffer,room_width,room_height);
surface_resize(application_surface,view_wport[0],view_hport[0]);

var vm = matrix_build_lookat(room_width/2,room_height/2,depthMin,room_width/2,room_height/2,0,false,true,false);
var pm = matrix_build_projection_ortho(room_width,room_height,0,lookDistance);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;