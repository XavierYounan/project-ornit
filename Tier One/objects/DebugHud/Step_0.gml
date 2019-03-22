if( keyboard_check_pressed( vk_f1))
{
	switch(debugMode)
	{
		case DEBUG_MODES.CONSOLE:
		{
			//Console destroy event
			O_GameConsole.displayingText = false
			
			//Switch the state
			debugMode = DEBUG_MODES.HITBOXES
			
			//Hitboxes create event
			with (pDisplayHitboxes)
			{
				showingHitbox = true	
			}
			break;
		}

		case DEBUG_MODES.HITBOXES:
		{
			//Hitboxes distroy event
			with (pDisplayHitboxes)
			{
				showingHitbox = false	
			}
			
			//switch the state
			debugMode = DEBUG_MODES.CONNECTION_INFO
			
			//Connection info create event
			//nothing yet
		
			break;
		}
		
		case DEBUG_MODES.CONNECTION_INFO:
		{
			//Connection info
			//nothing yet
			
			//switch the state
			debugMode = DEBUG_MODES.CONSOLE
			
			//Console create event
			O_GameConsole.displayingText = true
			break;	
		}
	}
}