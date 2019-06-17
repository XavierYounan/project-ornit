//magnet boi
serverState = parentId.state

switch(serverState)
{

	case state.playing:
	{
		switch(playerState)
		{
			case PLAYERSTATE.FREE:
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
			
					
					if ((_currentImput[IMPUTLIST.MOUSE_LEFT_CLICKED]) && (!_currentImput[IMPUTLIST.PROCESSED]) ) //if mouse left clicked and this frame hasnt been processed yet
					{
				
						playerState = PLAYERSTATE.ATTACK_SLASH
						slash_dirX = _currentImput[IMPUTLIST.MOUSE_X] - x
						slash_dirX = sign(slash_dirX)
						if (slash_dirX) = 0
						{
							slash_dirX = 1	
						}
					}		
				}
		
				#endregion
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
			
			case PLAYERSTATE.ATTACK_COMBO:
			{
				#region Attack slash code
				#endregion
				break;
			}
			
			case PLAYERSTATE.ATTACK_SLASH:
			{
				#region Attack combo code
				#region clear imput log
		
				var _arraySize = array_length_1d(m_imputLog)
				if (_arraySize > 0)
				{	
					parentId.m_lastProcessedImput = m_imputLog[0]
					m_imputLog = []
				}
		
				#endregion
				
				#region spawn in swing
				//create event
				if (swingObject = undefined)
				{
					swingObject = instance_create_depth(x + (20 * slash_dirX),y,-200,oMagnetBoiSlash)	
					swingObject.image_xscale = slash_dirX
					ds_list_clear(hitByAttack)
					
					#region Send state update
					var list = global.T1_CONNECTION_ID_LIST
					var _arrSize = array_length_1d(list)
					for(var i = 0; i < _arrSize; i++)
					{
						packet_tcp_send(list[i],TCP_PACKETS.T2_HERO_STATE_UPDATE,[m_ClientId, t1_magnetBoiState_SWING])
					}	
					#endregion
				}
				#endregion
				
				#region check for hits
				var hitByAttackNow = ds_list_create();
				var hits
				
				with(swingObject)
				{
					hits = instance_place_list(x, y, oDamageHitable, hitByAttackNow, false)
				}
				
				if (hits > 0)
				{
					for(var i = 0; i < hits; i++)	
					{
						//if this instance has not been hit by attack
						var hitID = hitByAttackNow[| i]
						if (ds_list_find_index(hitByAttack,hitID) == -1)
						{
							ds_list_add(hitByAttack,hitID)
							
							with(hitID)
							{
								if (hitID != id)
								{
									hp -= swingDamage	
								}
							}
						}
					}
				}
				ds_list_destroy(hitByAttackNow)
				#endregion
								
				#region check swing animation ended
				with(swingObject)
				{
					var animationEnded = animation_end()
				}
				
				if(animationEnded)
				{
					instance_destroy(swingObject)	
					swingObject = undefined
					playerState = PLAYERSTATE.FREE
				}
				
				#endregion
				#endregion
				break;
			}
				
		}
		
		#region Make sure not dead
		if (hp <= 0)
		{
			parentId.state = state.dead
			fConsoleAddMessage("Made dead, reason: HP_EQUAL_ZERO")
			
			var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_HEALTH_UPDATE,parentClientId,0)
			gnet_packet_send_to_list(_packet,global.T1_CONNECTION_ID_LIST)
			
			instance_destroy(self)
		}
		#endregion
	break;
	}
}
