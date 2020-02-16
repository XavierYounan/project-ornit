//For debugging
showingHitbox = false

//init enums for its objects
enum NINJA_ITEMS
{
	GUN,
	COLLISION_HITBOX
	
}

itemList = []

itemList[NINJA_ITEMS.GUN] = instance_create_depth(x,y,-101,oNinjaGun)
itemList[NINJA_ITEMS.COLLISION_HITBOX] = instance_create_depth(x,y,0,oNinjaCollisionHitbox)

vMove = 0
hsp = 0;
vsp = 0;
hMove_fraction = 0;
vMove_fraction = 0;


grv = 480;
walksp = 240;
jump_speed = 400;
maxVsp = grv


hasControl = true;

hp = 100;
bulletDamage = 5;

fireRate = 7 //per seccond
canShoot = true

m_imputLog = []


//Eventaully add a enum
playerState = 0

stunned = false
slowed = false
slow_percentage = 0.5 



var all_layers = layer_get_all();

for (var i=0; i<array_length_1d(all_layers); i++) 
{
    var this_layer = all_layers[i];
    var all_elements = layer_get_all_elements(this_layer);

    for (var j=0; j<array_length_1d(all_elements); j++) 
	{
      var this_element = all_elements[j];
      if (layer_get_element_type(this_element) == layerelementtype_tilemap) 
	  {
        var tmap = this_element;
		if  (tilemap_get_tileset(tmap) == tCollision)
		{
			tilemap = tmap	
			show_debug_message("Collision Tilemap found!")
		}
    
        if(tmap == -1) 
		{
            debug_log("Tilemap not found, tilemap: " + string(tmap) + " layerId: " + string(this_layer) + " layerName: " + layer_get_name(this_layer), ERROR_LEVEL.WARNING)
        }
      }
    }
}


