//Load 
_fname = get_string("WHAT IS THE MAP NAME", "test")

if (file_exists(_fname + ".sav"))
{
	var _wrapper = fLoadJSONFromSave(_fname + ".sav")
	var _list = _wrapper[? "ROOT"]
	
	for (var i = 0; i < ds_list_size(_list); i++)
	{
		var _map = _list[| i];
		
		var _obj = _map[? "obj"];
		
		with (instance_create_depth(0,0,0,asset_get_index(_obj)))
		{
			x = _map[? "x"]
			y = _map[? "y"]
		}
	}
	ds_map_destroy(_wrapper)
}