///@description Build height table then start game
draw_tilemap(tilemapid,0,0);

for (var i = heightsToGet-1; i >= 0; i--)
{
	var check = 0;
	while(check <= TILE_SIZE)
	{
		global.heights[i] = check	
		
		
		if(check = TILE_SIZE) break;
		if(surface_getpixel(application_surface, i, check) != c_black) break;
		check ++;
	}
	//debug_log("Height is " + string(global.heights[i]) + " i is " + string(i), ERROR_LEVEL.INFO)
}

//debug_log("finished getting heights", ERROR_LEVEL.WARNING)

room_goto_next();