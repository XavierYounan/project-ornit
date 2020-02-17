var _arrayLength = array_length_1d(itemList)

for (var i=0; i<_arrayLength ; i++)
{
	if(instance_exists(itemList[i]))
	{
		instance_destroy(itemList[i])
	}
	
}

instance_destroy(self)