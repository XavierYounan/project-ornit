serverState = parentId.state

switch(serverState)
{

	case state.playing:
	{
		#region Playing code		
		#region Loop through and apply imputs
		var _arraySize = array_length_1d(m_imputLog)
		
		/*
		var file;
		file = file_text_open_append(working_directory + "deltaTimes.txt");
		file_text_write_string(file, string(current_hour) + ":" + string(current_minute) + ":" + string(current_second) + ": processing unread imputs, length is " + string(_arraySize) + "\r\n");
		file_text_close(file);
		*/
		
		for (var i = _arraySize - 1; i >= 0; i--)
		{
			var _currentImput = m_imputLog[i];
		
			var _deltaTime = _currentImput[IMPUTLIST.DELTA_TIME]
	
			hsp = _currentImput[IMPUTLIST.HORISONTAL_KEYS] * walksp * _deltaTime / ONE_MILLION;
		
			vMove = _currentImput[IMPUTLIST.VERTICAL_KEYS];
			
			vsp += grv * _deltaTime/ ONE_MILLION;	
		
			//Jump
			if (place_meeting(x,y+1,oWall)) && (vMove = 1)
			{
				vsp = -jump_speed	
			}
			
			//Horisontal collision
			if (place_meeting(x+hsp,y,oWall))
			{
				while (!place_meeting(x+sign(hsp),y,oWall))
				{
					x += sign(hsp);	
				}
				hsp = 0;
			}
			x += hsp;

			//Vertical collision
			if (place_meeting(x,y+vsp,oWall))
			{
				while (!place_meeting(x,y+sign(vsp),oWall))
				{
					y += sign(vsp);	
				}
				vsp = 0;
			}
			y += vsp;
			
			with (itemList[NINJA_ITEMS.GUN])
			{
				x = other.x;
				y = other.y - 20;
	
				image_angle = point_direction(x,y,_currentImput[IMPUTLIST.MOUSE_X],_currentImput[IMPUTLIST.MOUSE_Y])
			}
				
			if ((_currentImput[IMPUTLIST.MOUSE_LEFT_CLICKED]) && (!_currentImput[IMPUTLIST.PROCESSED]) && (canShoot)) //if mouse left clicked and this frame hasnt been processed yet and can shoot
			{
				
				canShoot = false
				alarm[0] = room_speed/fireRate
				//create bullet
				with(instance_create_depth(x,y - 20,-102,oNinjaBullet))
				{
					direction = other.itemList[NINJA_ITEMS.GUN].image_angle	
					image_angle = direction - 90
					creator = other.parentClientId
					
					var buff = gnet_packet_build(PACKET_IDENTIFIER.T2_CREATE_BULLET,creator,x,y,direction)
					gnet_packet_send_to_list(buff,global.T1_CONNECTION_ID_LIST)
				}
			}
		}
		
		#endregion
			
		if (hp <= 0)
		{
			parentId.state = state.dead
			fConsoleAddMessage("Made dead, reason: HP_EQUAL_ZERO")
			
			var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_HEALTH_UPDATE,parentClientId,0)
			gnet_packet_send_to_list(_packet,global.T1_CONNECTION_ID_LIST)
			
			instance_destroy(self)
		}
		
		#region //clear imput log
		
		if (_arraySize > 0)
		{	
			parentId.m_lastProcessedImput = m_imputLog[0]
			m_imputLog = []
		}
		
		#endregion
		#endregion
		break;	
	}
}
