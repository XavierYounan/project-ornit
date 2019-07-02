var _arrayLength = array_length_1d(itemList)

for (var i=0; i<_arrayLength ; i++)
{
	instance_destroy(itemList[i])
}
ds_list_destroy(hitByAttack)
instance_destroy(self)