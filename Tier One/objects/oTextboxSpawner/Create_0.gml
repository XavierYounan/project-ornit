textboxList = ds_list_create()
textboxObjectList = ds_list_create()
textboxValues = ds_map_create()

ds_list_add(textboxList, "Username:xyrexy", "Ip:127.0.0.1", "Port:3000")

size = ds_list_size(textboxList)

xSpriteOrigin = 16
xSpriteSize = 256
xShift = -xSpriteSize/2 + xSpriteOrigin



ySpacing = room_height/(size + 2) //One for the play button one cause number of spaces = number of objects + 1
xPos = room_width/2 + xShift

for(var _i = 0; _i < size; _i++)
{
	var _id = instance_create_depth(xPos, ySpacing * (_i + 1), DEPTH.GUI,oTextbox)
	ds_list_add(textboxObjectList,id)
	with(_id)
	{
		var _string = stringSplit(other.textboxList[| _i],":")
		
		title = _string[0]
		message = _string[1]
		
		ds_map_add(other.textboxValues, title, message)	
		
		parent = other.id
		
		if title = "Ip"
		{
			other.ip_button_id = id	
		}
	}
}

with(instance_create_depth(xPos, ySpacing * (size + 1), DEPTH.GUI, oPlay))
{
	parent = other.id
	message = "PLAY"
}

