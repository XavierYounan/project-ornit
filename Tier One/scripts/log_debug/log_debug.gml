///@param Message
///@param Arguments..

var _message =  argument[0];

for (var _i = 1; _i < argument_count; _i++)
{
	_message = string_replace(_message, FORMAT_TOKEN, string(argument[_i]));	
}

debug_log(_message, ERROR_LEVEL.DEBUG)