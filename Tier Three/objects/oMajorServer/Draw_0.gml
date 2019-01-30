with(oConnectedServer)
{
	var _drawBuffer = other.m_drawBuffer * (m_connectionId) * 10
	
	draw_text(other.m_drawBuffer,_drawBuffer,"Connection ID : " + string(m_connectionId))
	draw_text(other.m_drawBuffer,_drawBuffer + other.m_drawBuffer,"Number of players : " + string(m_numberPlayers))
	draw_text(other.m_drawBuffer,_drawBuffer + 2 * other.m_drawBuffer,"Server state : " + string(m_serverState))
	draw_text(other.m_drawBuffer,_drawBuffer + 3 * other.m_drawBuffer,"Ip : " + string(m_ip))
	draw_text(other.m_drawBuffer,_drawBuffer + 4 * other.m_drawBuffer,"Port : " + string(m_port))
}