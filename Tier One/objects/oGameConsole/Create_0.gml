/// @description Initialise
if (!assert_singleton()) return;

m_maxMessages = 120;
m_messageList = ds_list_create();

displayingText = true

spam_message = ds_map_create()
spam_message_que = ds_list_create()

display_level = ERROR_LEVEL.DEBUG

enum ConsoleArray
{
	Message,
	Level
}

errorColours = ds_map_create()

ds_map_add(errorColours, ERROR_LEVEL.FATAL, c_maroon)
ds_map_add(errorColours, ERROR_LEVEL.ERROR, c_red)
ds_map_add(errorColours, ERROR_LEVEL.WARNING, c_orange)
ds_map_add(errorColours, ERROR_LEVEL.INFO, c_white)
ds_map_add(errorColours, ERROR_LEVEL.DEBUG, c_blue)


fConsoleAddMessage("Fatal", ERROR_LEVEL.FATAL)
fConsoleAddMessage("Error", ERROR_LEVEL.ERROR)
fConsoleAddMessage("Warning", ERROR_LEVEL.WARNING)
fConsoleAddMessage("Info", ERROR_LEVEL.INFO)
fConsoleAddMessage("Debug", ERROR_LEVEL.DEBUG)

