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
		}
		
		//Dont let it go outside
		x = clamp(x,xResolution/2,room_width - xResolution/2)
		y = clamp(y,yResolution/2,room_height - yResolution/2)
		
		var vm = matrix_build_lookat(x,y,depthMin,x,y,0,false,true,false);
		camera_set_view_mat(camera,vm);

		break;
	}
	
	case CAMERA_STATE.FOLLOW_PLAYER_CREATE:
	{
		//change projection to zoom in
		var pm = matrix_build_projection_ortho(xResolution,xResolution,0,lookDistance);
		camera_set_proj_mat(camera,pm);
		
		//Dont let it go outside
		x = clamp(x,xResolution/2,room_width - xResolution/2)
		y = clamp(y,yResolution/2,room_height - yResolution/2)
		
		//Set the state
		state = CAMERA_STATE.FOLLOW_PLAYER
		break;	
	}
	
	case CAMERA_STATE.SHOW_FULL_MAP:
	{
		var vm = matrix_build_lookat(room_width/2,room_height/2,depthMin,room_width/2,room_height/2,0,false,true,false);
		var pm = matrix_build_projection_ortho(room_width,room_height,0,lookDistance);
		
		camera_set_view_mat(camera,vm);
		camera_set_proj_mat(camera,pm);
		
		break;
	}
	
}


