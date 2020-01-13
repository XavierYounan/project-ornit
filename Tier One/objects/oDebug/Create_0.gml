enum ERROR_LEVEL
{
	FATAL,
	ERROR,
	WARNING,
	INFO,
	DEBUG,
	SPAM
}

spam_message = ds_map_create()
spam_message_que = ds_list_create()