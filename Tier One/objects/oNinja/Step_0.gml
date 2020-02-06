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
				debug_log("T2 object does not exist, oNinja, Local send inputs",ERROR_LEVEL.DEBUG , 2)
			}

			#endregion 
			

			#region Move Player
			var _unreadListSize = ds_list_size(m_unreadInputs)
	
			//Move player to last known position
			x = latest_acknowleged_packet[NINJA_LOCAL_LATEST_POSITION.X];
			y = latest_acknowleged_packet[NINJA_LOCAL_LATEST_POSITION.Y];
			
			
			// DEBUG , check if supplied position is a collision positon
			if (place_meeting(x,y,oWall))
			{
				debug_log("Player recienved a position from the server that was in a wall", ERROR_LEVEL.ERROR)	
			}
			

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
			// Compute render timestamp
			var now = current_time
			var render_timestamp = now - global.INTERPOLATION_TIME;
			
			//Copy the old list into a new one
			if !ds_list_empty(m_coordinateArray)
		    {
			    temp_list = ds_list_create();
			    ds_list_copy(temp_list, m_coordinateArray);
		    }
			else
			{
				//coordinate array is empty
				debug_log("Coordinate array is empty", ERROR_LEVEL.DEBUG)
				temp_list = ds_list_create()
				var array = [0,0,0,0,0]
				array[NINJA_NON_LOCAL_POSITION.PACKET_TIME] = current_time
				ds_list_add(temp_list,array,array)
			}

			#region Drop older positions
			if(ds_list_size(temp_list) >= 2)
			{
				var seccondEntry = temp_list[| 1]
				var seccondEntryTime = seccondEntry[NINJA_NON_LOCAL_POSITION.PACKET_TIME]
			
				while(ds_list_size(temp_list) > 2 && seccondEntryTime <= render_timestamp)
				{
				
					ds_list_delete(temp_list,0)
				
					//re establish seccond entry time
					var seccondEntry = temp_list[| 1]
					var seccondEntryTime = seccondEntry[NINJA_NON_LOCAL_POSITION.PACKET_TIME]
				}
			}
			#endregion
			
			var list_length = ds_list_size(temp_list)
			if( list_length >= 2)
			{
				//Interpolate between two surrounding authorative positions
				//First check positions are surrounding
				var entry0 = temp_list[| 0]
				var entry1 = temp_list[| 1]
				
				var timestamp0 = entry0[NINJA_NON_LOCAL_POSITION.PACKET_TIME]
				var timestamp1 = entry1[NINJA_NON_LOCAL_POSITION.PACKET_TIME]
				
				if(timestamp0 <= render_timestamp && render_timestamp <= timestamp1)
				{
					var x0 = entry0[NINJA_NON_LOCAL_POSITION.X];
					var x1 = entry1[NINJA_NON_LOCAL_POSITION.X];
					
					var y0 = entry0[NINJA_NON_LOCAL_POSITION.Y];
					var y1 = entry1[NINJA_NON_LOCAL_POSITION.Y];
					
					var ga0 = entry0[NINJA_NON_LOCAL_POSITION.GUN_DIRECTION];
					var ga1 = entry1[NINJA_NON_LOCAL_POSITION.GUN_DIRECTION];
						
					var t0 = timestamp0;
					var t1 = timestamp1;
					  

					x = x0 + (x1 - x0) * (render_timestamp - t0) / (t1 - t0);
		  
					y = y0 + (y1 - y0) * (render_timestamp - t0) / (t1 - t0);
						
					with (itemList[NINJA_ITEMS.GUN])
					{
							x = other.x;
							y = other.y - 20;
							image_angle = ga0 + (ga1 - ga0) * (render_timestamp - t0) / (t1 - t0);
					}
				}
				else
				{
					//Positions dont surround the current time
					//Take most recent position
					debug_log("Positions dont surround current time", ERROR_LEVEL.DEBUG)
					var latest_position = m_coordinateArray[| ds_list_size(m_coordinateArray) - 1]
				
					x = latest_position[NINJA_NON_LOCAL_POSITION.X]
					y = latest_position[NINJA_NON_LOCAL_POSITION.Y]
				
					with (itemList[NINJA_ITEMS.GUN])
					{
						x = other.x;
						y = other.y - 20;
						image_angle = latest_position[NINJA_NON_LOCAL_POSITION.GUN_DIRECTION]
					}	
					
				}
			}
			else
			{
				//There isnt enough positions to interpolate with, take most recent position
				debug_log("Not enough positions to interpolate",ERROR_LEVEL.INFO)
				var latest_position = m_coordinateArray[| 0]
				
				x = latest_position[NINJA_NON_LOCAL_POSITION.X]
				y = latest_position[NINJA_NON_LOCAL_POSITION.Y]
				
				with (itemList[NINJA_ITEMS.GUN])
				{
					x = other.x;
					y = other.y - 20;
					image_angle = latest_position[NINJA_NON_LOCAL_POSITION.GUN_DIRECTION]
				}	
			}
		
			ds_list_destroy(temp_list) //Make sure to clean up
			#endregion
		}
		break;
	}
}