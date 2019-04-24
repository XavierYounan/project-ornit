/// @description Initialise
if (!assert_singleton()) return;

m_maxMessages = 20;
m_messageList = ds_list_create();

enum controllerState
{
	typing,
	normal,
	notDisplayingMessages
}

controllerState = controllerState.normal

m_string = ""

f_ConsoleAddMessage("O_GameConsole has been created")