/// @description Initialise
if (!assert_singleton()) return;

m_maxMessages = 6;
m_messageList = ds_list_create();