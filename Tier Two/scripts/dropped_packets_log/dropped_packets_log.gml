/// @desc Add a message to our consoles list
//@param {string} The packet name
//@param {int} connection id where the info came from
//@param {array} array with the info

var array = [argument0,argument1,argument2]

with(oDebug)
{
	
	ds_list_add(droppedPacketsList,array);
	
	if (ds_list_size(droppedPacketsList) > droppedPacketsMaxMessages)
	{
		ds_list_delete(droppedPacketsList,0);	
	}
	
}