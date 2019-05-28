var timeDiff = current_time - last_logged_time

//makes it as accurate as possible
var newEntry = [string(timeDiff),string(current_month) + ":" + string(current_day) + ":" + string(current_hour) + ":" + string(current_minute)+ ":" + string(current_second)]
last_logged_time = current_time


if (file_exists(FILE_NAME + ".sav"))
{
	var _wrapper = load_JSON(FILE_NAME + ".sav")
	var _list = _wrapper[? "ROOT"]
	
	var _rootList = ds_list_create();
	
	for (var i = 0; i < ds_list_size(_list); i++)
	{
		var save_map = ds_map_create();
		var _map = _list[| i];
			
		ds_list_add(_rootList,save_map);
		ds_list_mark_as_map(_rootList,ds_list_size(_rootList) - 1);
	
		ds_map_add(save_map,"time_diff",_map[? "time_diff"])
		ds_map_add(save_map,"time_logged",_map[? "time_logged"])		
	}
	
	var save_map = ds_map_create();
	
	ds_list_add(_rootList,save_map);
	ds_list_mark_as_map(_rootList,ds_list_size(_rootList) - 1);
	
	ds_map_add(save_map,"time_diff",newEntry[0])
	ds_map_add(save_map,"time_logged",newEntry[1])
	
	//Wrap root list in a map
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper,"ROOT",_rootList);

	//save to string
	var _string = json_encode(_wrapper);


	fSaveStringToFile(FILE_NAME,_string);

	//clear data
	ds_map_destroy(_wrapper);


	//reset everything
	alarm[0] = save_time_secconds * GAME_FPS
}
else
{
	var _rootList = ds_list_create();	
	
	var save_map = ds_map_create();
	
	ds_list_add(_rootList,save_map);
	ds_list_mark_as_map(_rootList,ds_list_size(_rootList) - 1);
	
	ds_map_add(save_map,"time_diff",newEntry[0])
	ds_map_add(save_map,"time_logged",newEntry[1])
	
	//Wrap root list in a map
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper,"ROOT",_rootList);

	//save to string
	var _string = json_encode(_wrapper);
	
	fSaveStringToFile(FILE_NAME,_string);

	//clear data
	ds_map_destroy(_wrapper);	
	
	alarm[0] = save_time_secconds * GAME_FPS
}