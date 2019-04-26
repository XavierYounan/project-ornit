switch playerState
{
	case PLAYER_STATE.DEAD:
	{
		fConsoleAddMessage("State is dead")
		if isLocal
		{
			with(oCamera)
			{
				if state = CAMERA_STATE.FOLLOW_PLAYER
				{
					state = CAMERA_STATE.SHOW_FULL_MAP	
					
					with (oRespawn)
					{
						state = RESPAWN_STATE.CLICKABLE
					}	
				}
			}
		}
		
		break;
	}
	
	case PLAYER_STATE.RECIEVING_INFO:
	{
		fConsoleAddMessage("State is Recieving Info")
		break;
	}
	
	case PLAYER_STATE.PLAYING:
	{
		fConsoleAddMessage("State is Playing")
		if isLocal
		{
			with oCamera
			{
				if state = CAMERA_STATE.SHOW_FULL_MAP
				{
					state = CAMERA_STATE.FOLLOW_PLAYER_CREATE
					
				}
			}
			
			with oRespawn
			{
				state = RESPAWN_STATE.INACTIVE
			}	
		}
		break;
	}
}

