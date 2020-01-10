/// @desc Add a message to our consoles list
//@param {string} Message The message to display

if(!instance_exists(oGameConsole))
{
	return;
}

if (argument_count < 2)
{
	//add later
}

var numberArguments = argument_count

if numberArguments == 2
{
	priv_console_add_message([argument[0],argument[1]])
}
else
{
	var message = argument[0]
	var level = argument[1]
	var timeDelay = argument[2]

	timeDelay = timeDelay * 1000 //convert to millisecconds

	with(oGameConsole)
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
			priv_console_add_message([message,level])
			ds_map_add(spam_message,message,current_time + timeDelay)	
			ds_list_add(spam_message_que,message)
		}
	}
}
