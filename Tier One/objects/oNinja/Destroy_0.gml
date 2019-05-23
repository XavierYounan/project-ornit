var _arrayLength = array_length_1d(itemList)

for (var i=0; i<_arrayLength ; i++)
{
	instance_destroy(itemList[i])
}

fConsoleAddMessage("Ninja has been destroyed at x:y" + string(x) + ":" + string(y))

instance_destroy(self)