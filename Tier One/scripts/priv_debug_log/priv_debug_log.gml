var message = argument[0]
var level = argument[1]
var variables = argument[2]
var stack = argument[3]
var title = argument[4]


switch (level)
{
	case ERROR_LEVEL.FATAL:
	{
		sentry_capture_message(message, SENTRY_FATAL, stack, variables)
		priv_console_add_message(message, level)
		break;	
	}
	
	case ERROR_LEVEL.ERROR:
	{
		sentry_capture_message(message, SENTRY_ERROR, stack, variables)
		priv_console_add_message(message, level)
		break;	
	}
	
	case ERROR_LEVEL.WARNING:
	{
		sentry_capture_message(message, SENTRY_WARNING, stack, variables)
		priv_console_add_message(message, level)
		break;	
	}
	
	case ERROR_LEVEL.INFO:
	{
		sentry_add_breadcrumb(title , SENTRY_INFO, message)
		priv_console_add_message(message, level)
		break;	
	}
	
	case ERROR_LEVEL.DEBUG:
	{
		sentry_add_breadcrumb(title, SENTRY_DEBUG, message)
		priv_console_add_message(message, level)
		break;	
	}
	
	case ERROR_LEVEL.SPAM:
	{
		priv_console_add_message(message, level)
		break;	
	}
}