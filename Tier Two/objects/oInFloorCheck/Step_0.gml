if (mouse_check_button_pressed(mb_left))
{
	px = [mouse_x, mouse_y]
	
	var inFloor = InFloor(tilemap,px[0],px[1])
	var inRoof = InRoof(tilemap,px[0],px[1])
	
	show_debug_message(string_build("Floor: {}, Roof: {}", inFloor, inRoof))
}