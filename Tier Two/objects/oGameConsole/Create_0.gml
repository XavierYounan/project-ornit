/// @description Initialise


m_maxMessages = 120;
m_messageList = ds_list_create();

if (!assert_singleton()) return; //call after m_message list is created

displayingText = false

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
ds_map_add(errorColours, ERROR_LEVEL.SPAM, c_gray)

