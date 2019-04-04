serverState = parentClient.state

switch(serverState)
{
	case state.readyUp:
	{
		#region Clear imput log and registar imputs as processed
		var _arraySize = array_length_1d(m_imputLog)
		
		if (_arraySize)
		{
			m_lastProcessedImput = m_imputLog[0]
			m_imputLog = []
		}
		#endregion
		break;	
	}
	
	case state.playing:
	{
		#region Playing code
		
		var _arraySize = array_length_1d(m_imputLog)
			
		for (var i = _arraySize - 1; i >= 0; i--)
		{
			#region Loop through all unprocessed imputs etc
			var _currentImput = m_imputLog[i];
		
			var _deltaTime = _currentImput[IMPUTLIST.DELTA_TIME]
		
			#region //apply imputs and gravity
	
			hsp = _currentImput[IMPUTLIST.HORISONTAL_KEYS] * walksp * _deltaTime;
		
			vMove = _currentImput[IMPUTLIST.VERTICAL_KEYS];
		
			vsp += grv * _deltaTime;
			
			//Jump
			if (place_meeting(x,y+1,oWall)) && (vMove = 1)
			{
				vsp = -jump_speed	
			}

			#endregion
			
			#region //Collisions
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
			
			#endregion
		
			#region //Gun code (will be changed to single processed events such as sound etc.
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
					creator = other.m_ClientId 
					
					var buff = gnet_packet_build(PACKET_IDENTIFIER.T2_CREATE_BULLET,other.m_ClientId,x,y,direction)
					gnet_packet_send_to_list(buff,global.T1_CONNECTION_ID_LOADED_IN_LIST)
				}
				
				//set frame to processed
				var arr = [_currentImput[IMPUTLIST.HORISONTAL_KEYS], _currentImput[IMPUTLIST.VERTICAL_KEYS],_currentImput[IMPUTLIST.PACKET_NUMBER],_currentImput[IMPUTLIST.MOUSE_X],_currentImput[IMPUTLIST.MOUSE_Y],_currentImput[IMPUTLIST.MOUSE_LEFT_CLICKED],true,_currentImput[IMPUTLIST.TIME_RECIEVED] ]
				m_imputLog[i] = arr
			}
			#endregion
			#endregion
		}
				
		if (hp <= 0)
		{
			state = state.dead
		}
		
		#region //clear imput log
		
		if (_arraySize > 0)
		{
		m_lastProcessedImput = m_imputLog[0]
		m_imputLog = []
		}
		
		#endregion
		#endregion
		break;	
	}
}
