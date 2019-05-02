switch playerState
{
	case PLAYER_STATE.DEAD:
	{
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
		break;
	}
	
	case PLAYER_STATE.PLAYING:
	{
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

