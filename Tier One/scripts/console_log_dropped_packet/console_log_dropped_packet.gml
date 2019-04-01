/// @desc logs a dropped packet to the droppedPacketManager

/// @arg packet name
/// @arg connection id
/// @arg data
/// @arg {string} reason

with(oDroppedPacketLog)
{
	m_droppedPacketList = fArrayMoveBack(m_droppedPacketList,1);
	m_droppedPacketList[0] = [argument0,argument1,argument2,argument3];
	m_droppedPacketList = fArrayTrim(m_droppedPacketList,m_maxMessages);
}