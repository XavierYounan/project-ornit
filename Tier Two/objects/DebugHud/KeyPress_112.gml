/// @description Connect Info

switch(debugMode)
{
	case DEBUG_MODES.CONNECTION_INFO:
	{
		debugMode = DEBUG_MODES.NOTHING;
		
		with(pInvisibleForNetworkDebug)
		{
			image_alpha = 1
		}
		break;
	}
	
	
	case DEBUG_MODES.NOTHING:
	{
		debugMode = DEBUG_MODES.CONNECTION_INFO;
		with(pInvisibleForNetworkDebug)
		{
			image_alpha = 0
		}
		break;
	}
}