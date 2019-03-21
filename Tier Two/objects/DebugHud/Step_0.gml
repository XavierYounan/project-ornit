if( keyboard_check_pressed( vk_f1))
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
			//for other
			hitboxDisplayer = instance_create_depth(0,0,0,oDisplayHitboxes)
		
			//for itself
			with(pInvisibleForNetworkDebug)
			{
				image_alpha = 1
			}
		
			with(O_GameConsole)
			{
				controllerState = controllerState.normal
			}
		
			debugMode = DEBUG_MODES.HITBOXES
			
			break;
		}
		
		
		case DEBUG_MODES.HITBOXES:
		{
			debugMode = DEBUG_MODES.CONNECTION_INFO
		
			//for itslef
			instance_destroy(hitboxDisplayer)
			
			with(pInvisibleForNetworkDebug)
			{
				image_alpha = 0
			}
			
			break;
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