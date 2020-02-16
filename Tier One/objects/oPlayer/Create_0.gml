#macro SPD_WALK 3.5
#macro SPD_GRAVITY 0.4
#macro SPD_JUMP 7

hsp = 0;
vsp = 0;
hsp_fraction = 0;
vsp_fraction = 0;


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
    
        if(tmap != -1) 
		{
            show_debug_message("tilemap found at layer: " + string(layer_get_name(this_layer)))   
        }
        else 
		{
            show_debug_message("Tilemap not found, tilemap: " + string(tmap) + " layerId: " + string(this_layer) + " layerName: " + layer_get_name(this_layer))
        }
      }
    }
}



image_speed = 0
