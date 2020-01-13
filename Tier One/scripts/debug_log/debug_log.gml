/// @function debug_log(message, level, spam)
/// @desc Handles a debug message based on its level
/// @param {string} Message The message to display
/// @param {integer} Debug_level The severity of the debug message
/// @param {integer} Spam_limiter Pause time before same message is logged again

var stack = debug_get_callstack() //preserves stack as much as possible whilst retaining automation

if(!instance_exists(oDebug))
{
	
	show_debug_message("Error logging," + string(stack))
	return;
}

//Unpack variables
var message= argument[0]

if (argument_count > 1) 
{
	var level = argument[1]
}
else
{
	level = ERROR_LEVEL.DEBUG
	message += " no level defined, set as DEBUG"
}

var variables = (argument_count > 2) ? argument[2] : undefined;
var title = (argument_count > 3) ? argument[3] : undefined;
var spamLimiter = (argument_count > 4) ? argument[4] : undefined;



if (spamLimiter = undefined)
{
	priv_debug_log(message, level, variables, stack, title)	
}
else
{
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
			priv_debug_log(message, level, variables, stack, title)
			ds_map_add(spam_message,message,current_time + spamLimiter)	
			ds_list_add(spam_message_que,message)
		}
	}
}

