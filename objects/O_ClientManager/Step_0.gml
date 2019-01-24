#region //send imputs
var _keyUp = keyboard_check(ord("W"))
var _keyDown = keyboard_check(ord("S"))
var _keyLeft = keyboard_check(ord("A"))
var _keyRight = keyboard_check(ord("D"))

var _hsp = _keyRight - _keyLeft
var _vsp = _keyUp - _keyDown

		
if (instance_exists(oT2))
{
	var _T2Id = oT2.m_connectionId

	if (_T2Id = noone)
	{
		show_error("Could not send message to T2, connection id not defined",true)	
	}
	else
	{
		var _packet = gnet_packet_build(PACKET_IDENTIFIER.T1_KEYS,_hsp,_vsp,oServerTime.m_serverTime);
		gnet_packet_send_to_id(_packet,_T2Id);
		m_unreadImputs = fArrayAppend(m_unreadImputs,[_hsp,_vsp,oServerTime.m_serverTime]);
		m_imputPacketSent += 1
	}
}
else
{
	fConsoleAddMessage("T2 is dead : " + string(oServerTime.m_serverTime))
}

#endregion