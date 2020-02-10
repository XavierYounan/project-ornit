/// @description Checks to see if tileIndexition is below the floor height of a given tile, returns how deep in the floor
/// @arg tilemap
/// @arg x
/// @arg y

var tileIndex = tilemap_get_at_pixel(argument0, argument1, argument2)

if (tileIndex > 0) //pixel is in a tile
{
	if (tileIndex == 1) return (TILE_SIZE - (argument2 mod TILE_SIZE)); //pixel is in a solid tile
	
	var theRoof = global.heightsFromBottom[(argument1 mod TILE_SIZE) + (tileIndex * TILE_SIZE)]

	//debug_log("InRoof: " + string(theRoof), ERROR_LEVEL.WARNING)
	return( TILE_SIZE - (argument2 mod TILE_SIZE) - theRoof)
	
	
	
} 
else 
{
	//debug_log("InRoof, tile1 : " + string(TILE_SIZE - (argument2 mod TILE_SIZE)), ERROR_LEVEL.WARNING)
	return -(TILE_SIZE - (argument2 mod TILE_SIZE)); //how far below are we from this tile
}