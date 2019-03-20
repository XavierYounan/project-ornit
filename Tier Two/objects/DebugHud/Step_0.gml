keyboard_check_pressed(vk_f1)
{
	switch(debugMode)
	{
		case DEBUG_MODES.NOTHING:
		{
			debugMode = DEBUG_MODES.DROPPED_PACKETS;
		
			with(pInvisibleForNetworkDebug)
			{
				image_alpha = 0
			}
			
			with(O_GameConsole)
			{
				controllerState = controllerState.notDisplayingMessages
			}
			
			
			break;
		}

		case DEBUG_MODES.DROPPED_PACKETS:
		{
			debugMode = DEBUG_MODES.CONNECTION_INFO
			
			with(pInvisibleForNetworkDebug)
			{
				image_alpha = 0
			}
			
			with(O_GameConsole)
			{
				controllerState = controllerState.normal
			}
			
			break
		}
			
		//This one must be at the end as loops to the top add above
		case DEBUG_MODES.CONNECTION_INFO:
		{
			debugMode = DEBUG_MODES.NOTHING;
		
			with(pInvisibleForNetworkDebug)
			{
				image_alpha = 1
			}
			break;
		}
	}	
}
