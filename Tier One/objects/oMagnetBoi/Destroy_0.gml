var _arrayLength = array_length_1d(itemList)

for (var i=0; i<_arrayLength ; i++)
{
	instance_destroy(itemList[i])
}

var parts = [
[sMagnetArmL,12,-68],
[sMagnetArmR,-13,-68],
[sMagnetChest,-13,-69],
[sMagnetCrotch,-6,-43],
//[sMagnetElectricity,0,0], // not doing this one obviosult
[sMagnetFistL,13,-36],
[sMagnetFistR,-20,-35],
[sMagnetFootL,-10,-5],
[sMagnetFootR,6,-6],
[sMagnetHead,-11,-80],
[sMagnetLegL,6,-76],
[sMagnetLegR,-9,-37]
]


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