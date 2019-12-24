playerState = parent.playerState

switch playerState
{
	case PLAYER_STATE.PLAYING:
	{
		if(isLocal)
		{
			#region //send inputs	
			if (instance_exists(oT2))
			{
				var _T2Id = oT2.m_connectionId

				if (_T2Id = noone)
				{
					show_error("Could not send message to T2, connection id not defined",true)
				}

				#region Establish Variables
				
				var _keyUp = keyboard_check(ord("W"))
				var _keyDown = keyboard_check(ord("S"))
				var _keyLeft = keyboard_check(ord("A"))
				var _keyRight = keyboard_check(ord("D"))

				var _hsp = _keyRight - _keyLeft
				var _vsp = _keyUp - _keyDown

				var _mouseLeftClicked = mouse_check_button(mb_left)
			
				var deltaTime = clamp(global.dt_unsteady,0,4294967295) //buffer_u32 max is 4294967295
				
				#endregion
					
					
				if(keyboard_check(ord("O")))
				{
					localNinja = instance_create_depth(x,y,depth,oNinjaLocal)
				}
				
				if(keyboard_check(ord("P")))
				{
					localNinja.x = x
					localNinja.y = y
				}
					
				#region Send information 
				
				var _packet = gnet_packet_build(PACKET_IDENTIFIER.T1_NINJA,_hsp,_vsp,O_ClientManager.packet_number,mouse_x,mouse_y,_mouseLeftClicked,deltaTime);		
				gnet_packet_send_to_id(_packet,_T2Id);
				
				#endregion
		
				
				#region Increment packet number and record sent inputs
				O_ClientManager.packet_number ++
				ds_list_add(m_unreadInputs,[_hsp,_vsp,O_ClientManager.packet_number, 0,deltaTime]) //gun angle set to 0, remove later it is redundant
				#endregion
			}
			else
			{
				fConsoleAddMessage("T2 object does not exist, oNinja, Local send inputs",2)
			}

			#endregion 
			

			#region Move Player
			var _unreadListSize = ds_list_size(m_unreadInputs)
	
			//Move player to last known position
			x = latest_acknowleged_packet[NINJA_LOCAL_LATEST_POSITION.X];
			y = latest_acknowleged_packet[NINJA_LOCAL_LATEST_POSITION.Y];

			//Currently depreciated but support will be added later
			hsp = latest_acknowleged_packet[NINJA_LOCAL_LATEST_POSITION.HSP];
			
			vsp = latest_acknowleged_packet[NINJA_LOCAL_LATEST_POSITION.VSP];			
	
			//Loop through all unread inputs and calculate the new position

			if (_unreadListSize != 0)
			{
				for (var i = _unreadListSize - 1; i >= 0; i--)
				{
					movePlayer(id, m_unreadInputs[| i]);
				}
			}

			
			#endregion
			
			#region Move Gun

			with (itemList[NINJA_ITEMS.GUN])
			{
				x = other.x;
				y = other.y - 20;
				image_angle = point_direction(x,y,mouse_x,mouse_y)
				m_gunAngle = image_angle
			}
			#endregion
		}
		else
		{
			#region Interpolation code
			// Compute render timestamp.

			var now = current_time
			var render_timestamp = now - (1000.0 / SERVER_FPS);
  
			var buff_length = array_length_1d(m_coordinateArray)

			if(buff_length > 0)
			{
				var newPos = m_coordinateArray[0]
			
				var _x = newPos[0]
				var _y = newPos[1]
				var _t = newPos[2]
				var _ga = newPos[3]
			
				x = _x
				y = _y
			
				with (itemList[NINJA_ITEMS.GUN])
				{
					x = other.x;
					y = other.y - 20;
					image_angle = _ga
				}	
				m_coordinateArray = []
				fConsoleAddMessage("Non local coordinate is full and player has been moved")
			}
			else
			{
				fConsoleAddMessage("Non local coordinate array is empty")	
			}

			/*
			if (buff_length >= 2)
			{
				m_coordinateArray = fArrayTrim(m_coordinateArray,2)
				var old_position = m_coordinateArray[1]
				var new_position = m_coordinateArray[0]
				var buff_length = array_length_1d(m_coordinateArray)

				// Interpolate between the two surrounding authoritative positions.
				if ((buff_length >= 2) && (old_position[2] <= render_timestamp) && (render_timestamp <= new_position[2])) 
				{
					    var x0 = old_position[0];
					    var x1 = new_position[0];
		  
						var y0 = old_position[1];
						var y1 = new_position[1];
		
						var ga0 = old_position[3];
						var ga1 = new_position[3];
						
					    var t0 = old_position[2];
					    var t1 = new_position[2];

					    x = x0 + (x1 - x0) * (render_timestamp - t0) / (t1 - t0);
		  
						y = y0 + (y1 - y0) * (render_timestamp - t0) / (t1 - t0);
						
						with (itemList[NINJA_ITEMS.GUN])
						{
								x = other.x;
								y = other.y - 20;
								image_angle = ga0 + (ga1 - ga0) * (render_timestamp - t0) / (t1 - t0);
						}
					
				}
			}
			*/
			#endregion
		}
		break;
	}
}