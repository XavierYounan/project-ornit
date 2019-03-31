/// @desc logs a dropped packet to the droppedPacketManager

/// @arg packet name
/// @arg connection id
/// @arg data
/// @arg {string} reason

with(oDroppedPacketLog)
{
	ds_list_add(m_droppedPacketList,[argument0,argument1,argument2,argument3]);
	
	if (ds_list_size(m_droppedPacketList) > m_maxMessages)
	{
		ds_list_delete(m_droppedPacketList,0);	
	}
}