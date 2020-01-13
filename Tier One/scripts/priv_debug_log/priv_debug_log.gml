var message = argument[0]
var level = argument[1]

switch (level)
{
	case ERROR_LEVEL.FATAL:
	{
		sentry_capture_message(message, SENTRY_FATAL)
		priv_console_add_message(message, level)
		break;	
	}
	
	case ERROR_LEVEL.ERROR:
	{
		sentry_capture_message(message, SENTRY_ERROR)
		priv_console_add_message(message, level)
		break;	
	}
	
	case ERROR_LEVEL.WARNING:
	{
		sentry_capture_message(message, SENTRY_WARNING)
		priv_console_add_message(message, level)
		break;	
	}
	
	case ERROR_LEVEL.INFO:
	{
		sentry_add_breadcrumb("general category", SENTRY_INFO, message)
		priv_console_add_message(message, level)
		break;	
	}
	
	case ERROR_LEVEL.DEBUG:
	{
		sentry_add_breadcrumb("general category", SENTRY_DEBUG, message)
		priv_console_add_message(message, level)
		break;	
	}
	
	case ERROR_LEVEL.SPAM:
	{
		priv_console_add_message(message, level)
		break;	
	}
}