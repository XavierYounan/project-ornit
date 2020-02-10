/// @description Checks to see if tileIndexition is below the floor height of a given tile, returns how deep in the floor
/// @arg tilemap
/// @arg x
/// @arg y

var tileIndex = tilemap_get_at_pixel(argument0, argument1, argument2)

if (tileIndex > 0) //if pixel is in a tile
{
	if (tileIndex == 1) return (argument2 mod TILE_SIZE); //solid tile
	
	var theFloor = global.heightsFromTop[(argument1 mod TILE_SIZE) + (tileIndex * TILE_SIZE)]
	return ((argument2 mod TILE_SIZE) - theFloor);
} 
else //if pixel is not in a tile
{	
	var distFromCurrentTile = -(TILE_SIZE - (argument2 mod TILE_SIZE))
	if (distFromCurrentTile = 0)
	{
		distFromCurrentTile = -32	
	}
	return distFromCurrentTile
}


