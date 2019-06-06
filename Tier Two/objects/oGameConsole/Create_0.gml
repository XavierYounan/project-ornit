enum controllerState
{
	typing,
	normal,
	notDisplayingMessages
}

controllerState = controllerState.normal

m_string = ""

fConsoleAddMessage("oGameConsole has been created")

/// @description Initialise
if (!assert_singleton()) return;

m_maxMessages = 120;
m_messageList = ds_list_create();

displayingText = true

spam_message = ds_map_create()
spam_message_que = ds_list_create()