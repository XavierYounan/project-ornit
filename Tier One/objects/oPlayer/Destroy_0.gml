if (itemList[CHARACTER] != undefined)
{
	instance_destroy(itemList[CHARACTER])
	instance_destroy(itemList[NINJAGUN])
}

instance_destroy(self)