var _filename = get_string("FILENAME","Mapname");

var _rootList = ds_list_create();

//for every instance create a map and add the map to the root list
with (oSaveAble)
{
	var _map = ds_map_create();
	ds_list_add(_rootList,_map);
	ds_list_mark_as_map(_rootList,ds_list_size(_rootList) - 1);
	
	var _obj = object_get_name(object_index);
	ds_map_add(_map,"obj",_obj);
	ds_map_add(_map,"x",x);
	ds_map_add(_map,"y",y);
	
}


//Wrap root list in a map
var _wrapper = ds_map_create();
ds_map_add_list(_wrapper,"ROOT",_rootList);


//save to string
_string = json_encode(_wrapper);


fSaveStringToFile(_filename,_string);

//clear data
ds_map_destroy(_wrapper);
