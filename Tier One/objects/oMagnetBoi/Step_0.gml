playerState = parent.playerState

switch playerState
{
	case PLAYER_STATE.PLAYING:
	{
		if(isLocal)
		{
			#region Send Imputs
			
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
				
				with (itemList[NINJA_ITEMS.GUN])
				{
					x = other.x;
					y = other.y - 20;
					image_angle = point_direction(x,y,mouse_x,mouse_y)
					m_gunAngle = image_angle
				}

				#endregion
					
					
				#region Send information 
				
				var _packet = gnet_packet_build(PACKET_IDENTIFIER.T1_NINJA,_hsp,_vsp,O_ClientManager.packet_number,mouse_x,mouse_y,_mouseLeftClicked,deltaTime);
				gnet_packet_send_to_id(_packet,_T2Id);
				
				#endregion
				
				
				#region Update packet number and unread imputs (needs improvment see notes)
				
				with(O_ClientManager)
				{
					packet_number ++
					m_unreadImputs = fArrayMoveBack(m_unreadImputs,1);
					m_unreadImputs[0] = [_hsp,_vsp,packet_number,_gunAngle,deltaTime];	
				}
				
				#endregion
			}
			else
			{
				fConsoleAddMessage("T2 is dead : " + string(oServerTime.m_serverTime))
			}

			#endregion 
			
	
			#region Local code
			var _unreadList = O_ClientManager.m_unreadImputs
			var _unreadListSize = array_length_1d(_unreadList)
	
			var _x = latest_acknowleged_packet[LOCAL_LATEST_POSITION.X];
			var _y = latest_acknowleged_packet[LOCAL_LATEST_POSITION.Y];

			var _hsp = latest_acknowleged_packet[LOCAL_LATEST_POSITION.HSP];
			var _vsp = latest_acknowleged_packet[LOCAL_LATEST_POSITION.VSP];	
					
			var state = latest_acknowleged_packet[LOCAL_LATEST_POSITION.STATE]
	
			if (_unreadListSize != 0)
			{
				for (var i = _unreadListSize - 1; i >= 0; i--)
				{			
					switch(state)
					{
						case  MAGNET_BOI_STATE.FREE:
						{
							#region Loop through each unread imput and calucate a new position
							var _currentImput = _unreadList[i];
		
							var _deltaTime = _currentImput[UNREAD_IMPUTS.DELTA_TIME]
							
							switch (_state)
							{
								case STATE.	
							}
		
							_hsp = _currentImput[UNREAD_IMPUTS.HSP] * walksp * _deltaTime / ONE_MILLION;
		
							vMove = _currentImput[UNREAD_IMPUTS.VSP];
		
							_vsp += grv * _deltaTime / ONE_MILLION;

							//Jump
							if (place_meeting(_x,_y+1,oWall)) && (vMove = 1)
							{
								_vsp = -jump_speed	
							}

							//Horisontal collision
							if (place_meeting(_x+_hsp,_y,oWall))
							{
								while (!place_meeting(_x+sign(_hsp),_y,oWall))
								{
									_x += sign(_hsp);	
								}
								_hsp = 0;
							}
							_x += _hsp;

							//Vertical collision
				
							if (place_meeting(_x,_y+_vsp,oWall))
							{
								while (!place_meeting(_x,_y+sign(_vsp),oWall))
								{
									_y += sign(_vsp);	
								}
								_vsp = 0;
							}
							_y += _vsp;

							if (_hsp != 0) image_xscale = sign(_hsp);								
							#endregion
							break;	
						}
						
						case  MAGNET_BOI_STATE.FREE:
						{
							
							break;	
						}
						
						case  MAGNET_BOI_STATE.FREE:
						{
							
							break;	
						}
						
						default: fConsoleAddMessage("oMagnetBoi state is in default. ERROR", 2)
					}
							
				}
			}
	
			x = _x;
			y = _y;
			
			#endregion
			break;	
		}
		else
		{
			#region Interpolation code
			// Compute render timestamp.

			var now = current_time
			var render_timestamp = now - (1000.0 / SERVER_FPS);
  
			var buff_length = array_length_1d(m_coordinateArray)

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
					
				}
			}
			#endregion
		}
		break;
	}
}

