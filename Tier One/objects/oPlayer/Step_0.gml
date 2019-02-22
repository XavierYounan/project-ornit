switch playerState
{
	case RECIEVINGINFO:
	{
		
		break;
	}
	
	case PLAYING:
	{
		#region //game code
		if(isLocal)
		{
			var _unreadList = O_ClientManager.m_unreadImputs
			var _unreadListSize = array_length_1d(_unreadList)
	
			var _x = latest_acknowleged_packet[0]
			var _y = latest_acknowleged_packet[1]
			var _hsp = latest_acknowleged_packet[3]
			var _vsp = latest_acknowleged_packet[4]
			
			
	
			for (var i = _unreadListSize - 1; i >= 0; i--)
			{
				var _currentImput = _unreadList[i];
		
				if (i = _unreadListSize - 1)
				{
					var _lastFrameTime = latest_acknowleged_packet[2]	
				}
				else
				{
					var _unpack = _unreadList[i+1]
					var _lastFrameTime = _unpack[2]	
				}
		
				var _thisFrameTime = _currentImput[2]
				var _millisecondDelta = _thisFrameTime - _lastFrameTime
		
				var _deltaTime = _millisecondDelta / 1000
		
				_hsp = _currentImput[0] * walksp * _deltaTime;
		
				vMove = _currentImput[1];
		
				_vsp += grv * _deltaTime;

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
				
				

				/*
				var _bulletsTouching;
				_bulletsTouching = instance_place(x, y, oBullet);
				if (_bulletsTouching != noone)
				{   
					hp -= O_Client.bulletDamage;
					with (oBullet) instance_destroy();
				}

				*/
		
				/*
				  //Animation
				if (!place_meeting(x,y+1,oWall))
				{
					sprite_index = sPlayerAir;
					image_speed = 0;
					if (sign(vsp) > 0) image_index = 1; else image_index = 0;
				}
				else
				{
					image_speed = 1;
					if (hsp == 0)
					{
						sprite_index = sPlayer;	
					}
					else
					{
						sprite_index = sPlayerRun;	
					}
				}

				*/

				if (_hsp != 0) image_xscale = sign(_hsp);
		
		
			}
	
	
	
			x = _x;
			y = _y;
					
			itemList[CHARACTER].x = x;
			itemList[CHARACTER].y = y;
			
			with (itemList[NINJAGUN])
			{
				x = other.x + sign(hsp) * 5;
				y = other.y - 20;
				image_angle = point_direction(x,y,mouse_x,mouse_y)
				O_ClientManager.m_gunAngle = image_angle
			}

		}
		else
		{
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
						
						with (itemList[NINJAGUN])
						{
								x = other.x + sign(hsp) * 5;
								y = other.y - 20;
								image_angle = ga0 + (ga1 - ga0) * (render_timestamp - t0) / (t1 - t0);
						}
						
						itemList[CHARACTER].x = x;
						itemList[CHARACTER].y = y;
				}
			}
		
		}

		#endregion
		break;
	}
}

