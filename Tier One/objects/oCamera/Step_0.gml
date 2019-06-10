switch state
{
	case CAMERA_STATE.FOLLOW_PLAYER:
	{
		#region Follow the player
		
		if (localPlayer != id)
		{
			xTo = localPlayer.hero.x + (mouse_x - other.x)/4 
			yTo = localPlayer.hero.y + (mouse_y - other.y)/4 
		}
		else
		{
			event_user(CAMERA_EVENT.FULL_SCREEN)
			fConsoleAddMessage("There is no local player assigned to the camera!")
		}
		
		x += (xTo - x)/25
		y += (yTo - y)/25
		
		//Dont let it go outside
		x = clamp(x,cameraWidth/2,room_width - cameraWidth/2)
		y = clamp(y,cameraHeight/2,room_height - cameraHeight/2)
		
		var vm = matrix_build_lookat(x,y,depthMin,x,y,0,false,true,false);
		camera_set_view_mat(camera,vm);
		
		#endregion
		break;
	}
	
	
	case CAMERA_STATE.SHOW_FULL_MAP:
	{
		#region show full map
		
		var vm = matrix_build_lookat(room_width/2,room_height/2,depthMin,room_width/2,room_height/2,0,false,true,false);
		cameraWidth = room_width
		cameraHeight = room_height
		var pm = matrix_build_projection_ortho(cameraWidth,cameraHeight,0,lookDistance);
		
		camera_set_view_mat(camera,vm);
		camera_set_proj_mat(camera,pm);
		
		#endregion
		break;
	}
	
}