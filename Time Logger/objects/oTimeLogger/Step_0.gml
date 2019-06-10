if keyboard_check(ord("T"))
{
	total_time = 0
	
	if (file_exists(FILE_NAME + ".sav"))
	{
		var _wrapper = load_JSON(FILE_NAME + ".sav")
		var _list = _wrapper[? "ROOT"]
	
		for (var i = 0; i < ds_list_size(_list); i++)
		{
			var _map = _list[| i];
		
			total_time += _map[? "time_diff"]
		}
		ds_map_destroy(_wrapper)
	}
}
