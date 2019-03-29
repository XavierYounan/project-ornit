switch state
{
	case CAMERA_STATE.FOLLOW_PLAYER:
	{
		x += (xTo - x)/25
		y += (yTo - y)/25
		
		if (localPlayer != noone)
		{
			xTo = localPlayer.x + (mouse_x - other.x)/4 
			yTo = localPlayer.y + (mouse_y - other.y)/4 
		}
		else
		{
			state = CAMERA_STATE.SHOW_FULL_MAP	
			
			with (oRespawn)
			{
				state = RESPAWN_STATE.CLICKABLE
			}
		}
		
		//Dont let it go outside
		x = clamp(x,global.cameraWidth/2,room_width - global.cameraWidth/2)
		y = clamp(y,global.cameraHeight/2,room_height - global.cameraHeight/2)
		
		var vm = matrix_build_lookat(x,y,depthMin,x,y,0,false,true,false);
		camera_set_view_mat(global.camera,vm);

		break;
	}
	
	case CAMERA_STATE.FOLLOW_PLAYER_CREATE:
	{
		//change projection to zoom in
		global.cameraWidth = 1920
		global.cameraHeight = 1080
		var pm = matrix_build_projection_ortho(global.cameraWidth,global.cameraHeight,0,lookDistance);
		camera_set_proj_mat(global.camera,pm);
		
		//Dont let it go outside
		x = clamp(x,xResolution/2,room_width - xResolution/2)
		y = clamp(y,yResolution/2,room_height - yResolution/2)
		
		with (oRespawn)
		{
			state = RESPAWN_STATE.INACTIVE
			buttonState = BUTTON_STATE.NOTHING
		}
			
		
		//Set the state
		state = CAMERA_STATE.FOLLOW_PLAYER
		break;	
	}
	
	case CAMERA_STATE.SHOW_FULL_MAP:
	{
		var vm = matrix_build_lookat(room_width/2,room_height/2,depthMin,room_width/2,room_height/2,0,false,true,false);
		global.cameraWidth = room_width
		global.cameraHeight = room_height
		var pm = matrix_build_projection_ortho(global.cameraWidth,global.cameraHeight,0,lookDistance);
		
		camera_set_view_mat(global.camera,vm);
		camera_set_proj_mat(global.camera,pm);
		
		break;
	}
	
}

global.cameraX = x - global.cameraWidth/2
global.cameraY = y - global.cameraHeight/2