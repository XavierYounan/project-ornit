if(showDebug)
{
	var edgeBuffer = 30
	var yBuffer = 20
	var left = window_get_x()
	var top = window_get_y()
	
	draw_text(left + edgeBuffer,top + edgeBuffer,"Server Time : " + string(m_serverTime))
	draw_text(left + edgeBuffer,top + edgeBuffer + yBuffer,"Times ran : " + string(m_timesUpdated))
	draw_text(left + edgeBuffer,top + edgeBuffer + 2 * yBuffer,"Server offset : " + string(m_serverTimeOffset))
}
