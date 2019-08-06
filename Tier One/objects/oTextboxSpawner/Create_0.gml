textboxList = ds_list_create()
textboxObjectList = ds_list_create()

ds_list_add(textboxList, "Username:xyrexy", "Ip:127.0.0.1", "Port:3000")

size = ds_list_size(textboxList)

xSpriteOrigin = 16
xSpriteSize = 256
xShift = -xSpriteSize/2 + xSpriteOrigin

ySpacing = room_height/(size + 1)
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
	}
}

