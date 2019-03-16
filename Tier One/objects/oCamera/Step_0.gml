switch state
{
	case CAMERA_STATE.FOLLOW_PLAYER:
	{
		x += (xTo - x)/25
		y += (yTo - y)/25
		
		if (localPlayer != noone)
		{
			xTo = x = other.x + (mouse_x - other.x)/4 
			yTo = y = other.y + (mouse_x - other.x)/4 
		}
		else
		{
			state = CAMERA_STATE.SHOW_FULL_MAP	
		}
		
		var vm = matrix_build_lookat(x,y,depthMin,x,y,0,false,true,false);
		camera_set_view_mat(camera,vm);

		break;
	}
	
	case CAMERA_STATE.FOLLOW_PLAYER_CREATE:
	{
		//change projection to zoom in
		var pm = matrix_build_projection_ortho(xResolution,xResolution,0,lookDistance);
		camera_set_proj_mat(camera,pm);
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


