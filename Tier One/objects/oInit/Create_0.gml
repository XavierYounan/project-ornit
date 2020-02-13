// quickly get the player to accept permisions if the havent before by starting then closing a network
//Make sure network can be created, get past firewall before connecting
gnet_start_network(1,PROTOCOL_ID,3111, "temp connection") 



///@description Initilise all objects before starting
global.developer_mode = true

instance_create_depth(-10,-10,DEPTH.GUI,oDebug)
 
#macro TILE_SIZE 32

heightsToGet = sprite_get_width(sCollision);

tiles = heightsToGet / TILE_SIZE;

//create Tiles
var layerid = layer_create(0, "Tiles");
tilemapid = layer_tilemap_create(layerid, 0, 0, tCollision, tiles, 1);

for (var i = 0; i <= tiles; i++)
{
	tilemap_set(tilemapid,i,i,0)
}

