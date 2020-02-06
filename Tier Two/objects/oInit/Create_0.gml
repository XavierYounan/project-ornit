///@description Initilise all objects before starting
global.developer_mode = true

instance_create_depth(-10,-10,-100,oDebug) //Fix depth later
 
#macro TILE_SIZE 32

heightsToGet = sprite_get_width(sCollision);

//debug_log("heights to get is " + string(heightsToGet), ERROR_LEVEL.WARNING)
tiles = heightsToGet / TILE_SIZE;

//create Tiles
var layerid = layer_create(0, "Tiles");
tilemapid = layer_tilemap_create(layerid, 0, 0, tCollision, tiles, 1);

for (var i = 0; i <= tiles; i++)
{
	tilemap_set(tilemapid,i,i,0)
}