with(oGameConsole)
{
	ds_list_add(m_messageList,[argument0, argument1]);
	
	if (ds_list_size(m_messageList) > m_maxMessages)
	{
		ds_list_delete(m_messageList,0);	
	}
}