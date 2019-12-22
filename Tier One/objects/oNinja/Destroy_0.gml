var _arrayLength = array_length_1d(itemList)

for (var i=0; i<_arrayLength ; i++)
{
	instance_destroy(itemList[i])
}

with (parent)
{
	hero = null	
}

instance_destroy(self)
ds_list_destroy(m_unreadInputs)