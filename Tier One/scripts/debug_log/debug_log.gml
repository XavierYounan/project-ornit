/// @function debug_log(message, level, spam)
/// @desc Handles a debug message based on its level
/// @param {string} Message The message to display
/// @param {integer} Debug_level The severity of the debug message
/// @param {integer} Spam_limiter Pause time before same message is logged again

if(!instance_exists(oDebug))
{
	var stack = debug_get_callstack()
	show_debug_message("Error logging," + string(stack))
	return;
}

var numberArguments = argument_count

if (numberArguments < 2)
{
	/*
		Tempoary solution
		Will go through and update old fConsole stuff
		Focussing on system right now
	
	*/
	
	var message = argument[0]
	var level = ERROR_LEVEL.DEBUG
	debug_log("debug log was called with less than two arguments", ERROR_LEVEL.SPAM)	
	return;
}

if (numberArguments > 3)
{
	debug_log("debug log was called with more than three arguments", ERROR_LEVEL.WARNING)	
	return;
}

if (numberArguments = 2)
{
	var message = argument[0]
	var level = argument[1]
	priv_debug_log(message, level)	
}


if (numberArguments = 3)
{
	var message = argument[0]
	var level = argument[1]
	var spamLimiter = argument[2]
	
	spamLimiter = spamLimiter * 1000 //convert to millisecconds

	with(oDebug)
	{
		//clear displayable messages
		var listSize = ds_list_size(spam_message_que)

		for(var i = 0; i < listSize; i++)
		{
			var message = spam_message_que[| i]
			var timeMessageExpires = spam_message[? message]
	
			if (current_time > timeMessageExpires) //message block is expired, remove block
			{
				ds_map_delete(spam_message,message)
				ds_list_delete(spam_message_que,i)
				i--
			}
			
			var listSize = ds_list_size(spam_message_que)
		}
		
		//if can display message
	
		var timeCanDisplay = spam_message[? message]
	
		if timeCanDisplay == undefined //message is able to be displayed
		{
			priv_debug_log(message,level)
			ds_map_add(spam_message,message,current_time + spamLimiter)	
			ds_list_add(spam_message_que,message)
		}
	}
}

