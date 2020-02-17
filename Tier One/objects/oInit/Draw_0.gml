/// @description Insert description here
// You can write your code in this editor


///@description Build height table then start game


draw_tilemap(tilemapid,0,0);

for (var i = heightsToGet-1; i >= 0; i--) //(x,y) = (0,0) is first point
{
	var check = 0;
	while(true)
	{	
		if(check = TILE_SIZE) break;
		if(surface_getpixel(application_surface, i, check) != c_black) break;
		check ++;
	}
	global.heightsFromTop[i] = check;
	
	var check = TILE_SIZE - 1; 
	while(true)
	{
		if(check = -1) break;
		if(surface_getpixel(application_surface, i, check) != c_black) break;
		check --;
	}
	global.heightsFromBottom[i] = 31 - check; //bottom pixel is at position 31 (not 32)S
	
}





gnet_stop_network()
room_goto_next()