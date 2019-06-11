var _arrayLength = array_length_1d(itemList)

for (var i=0; i<_arrayLength ; i++)
{
	instance_destroy(itemList[i])
}

var parts = [[sMagnetArmL,0,0],[sMagnetArmR,0,0]]

var instanceNumber = array_length_1d(parts)

for(var i = 0; i < instanceNumber; i++)
{
	with( instance_create_depth(0,0,-101,oBodyRagdol))
	{
		var arr = parts[i]
		mask_index = arr[0]
		sprite_index = arr[0]
		x = other.x + arr[1]
		y = other.y + arr[2]
	}
}


instance_destroy(self)