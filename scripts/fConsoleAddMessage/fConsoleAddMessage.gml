/// @desc Add a message to our consoles list
//@param {string} Message The message to display

with(O_GameConsole)
{
	ds_list_add(m_messageList,argument0);
	
	if (ds_list_size(m_messageList) > m_maxMessages)
	{
		ds_list_delete(m_messageList,0);	
	}
}