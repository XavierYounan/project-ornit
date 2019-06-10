var _arrayLength = array_length_1d(itemList)

for (var i=0; i<_arrayLength ; i++)
{
	instance_destroy(itemList[i])
}

if(isLocal)
{
	with(oCamera)
	{
		event_user(CAMERA_EVENT.FULL_SCREEN)
	}
}

with (parent)
{
	hero = null	
}

instance_destroy(self)