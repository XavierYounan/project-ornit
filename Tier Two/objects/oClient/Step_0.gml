
switch state
{
	case state.waitingForInfo:
	{
		//do nothing just wait untill recieve info then state will be set to sending
		break;
	}
	
	case state.sendingInfo:
	{
		m_timeLeft --
		
		if (m_timeLeft <= 0)
		{
			m_timeLeft = m_repeatFrequency
			m_repeatLeft --
			
			with(oClient)
			{
				if (other.m_ClientId = m_ClientId)
				{
					var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_LOCAL_PLAYER_INFO,m_ClientId,m_character,m_username)	
					gnet_packet_send_to_id(_packet,m_ClientId)
					f_ConsoleAddMessage("Sent iformation about itself to " + string(m_ClientId))
				}
				else
				{
					var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_PLAYER_INFO,m_ClientId,m_character,m_username)
					gnet_packet_send_to_id(_packet,other.m_ClientId)	
					f_ConsoleAddMessage("Sent the already connected players info to " + string(other.m_ClientId))
					
					var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_PLAYER_INFO,other.m_ClientId,other.m_character,other.m_username)
					gnet_packet_send_to_id(_packet,m_ClientId)
					f_ConsoleAddMessage("Sent the newly connected players info to " + string(m_ClientId))
				}
			}
			
			if (m_repeatLeft <=0)
			{
				f_ConsoleAddMessage("Never Recieved Clients Information!")
				state = state.error
			}	
		}
		break;
	}	
	
	case state.readyUp:
	{
		var _arraySize = array_length_1d(m_imputLog)
		
		if (_arraySize)
		{
			m_lastProcessedImput = m_imputLog[0]
			m_imputLog = []
		}
		
		#region //Ready Up
		if (m_framesTillUpdate = 0)
		{
			var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_OTHER_POSITION,x,y,m_ClientId)
			gnet_packet_send_to_list_exclude(_packet,global.T1_CONNECTION_ID_LIST,[m_ClientId])
			
			var packet = gnet_packet_build(PACKET_IDENTIFIER.T2_SELF_POSITION,x,y,m_ClientId,m_lastProcessedImput[2])
			gnet_packet_send_to_id(packet,m_ClientId)
			
			m_framesTillUpdate = m_updateFrequencyFrames + 1
		}
		
		m_framesTillUpdate --;
		break;
		#endregion
		
	}
	
	case state.playing:
	{
		#region //loop through and calucate delta imputs
		
		var _arraySize = array_length_1d(m_imputLog)
			
		for (var i = _arraySize - 1; i >= 0; i--)
		{
			
			var _currentImput = m_imputLog[i];
		
			if (i = _arraySize - 1)
			{
				var _lastFrameTime = m_lastProcessedImput[2]	
			}
			else
			{
				var _unpack = m_imputLog[i+1];
				var _lastFrameTime = _unpack[2]	;
			}
			
			var _thisFrameTime = _currentImput[2];
			var _millisecondDelta = _thisFrameTime - _lastFrameTime;
		
			var _deltaTime = _millisecondDelta / 1000;
			
			#endregion
		#region //apply imputs and gravity
	
			hsp = _currentImput[0] * walksp * _deltaTime;
		
			vMove = _currentImput[1];
		
			vsp += grv * _deltaTime;
			
			//Jump
			if (place_meeting(x,y+1,oWall)) && (vMove = 1)
			{
				vsp = -jump_speed	
			}

		#endregion
		#region //Collossions

			
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
		#region //Gun Angle
			
			itemList[NINJAGUN].image_angle = point_direction(x,y,_currentImput[3],_currentImput[4])
			
			if ((_currentImput[5]) && (!_currentImput[6])) //if mouse left clicked and this frame hasnt been processed yet
			{
				//create bullet
				with(instance_create_depth(x,y - 40,-102,oNinjaBullet))
				{
					direction = other.itemList[other.NINJAGUN].image_angle	
				}
				
				//set frame to processed
				m_imputLog[i] = [_currentImput[0],_currentImput[1],_currentImput[2],_currentImput[3],_currentImput[4],_currentImput[5],true]
			}
			
		
		#endregion
		}
		
		with (itemList[CHARACTER])
		{
			x = other.x;
			y = other.y;
		}
		
		with (itemList[NINJAGUN])
		{
			x = other.x;
			y = other.y - 20;
		}
		
		#region //clear imput log
		
		if (_arraySize > 0)
		{
		m_lastProcessedImput = m_imputLog[0]
		m_imputLog = []
		}
		
		#endregion
		
		if (m_framesTillUpdate <= 0)
		{
			var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_OTHER_POSITION,x,y,m_ClientId,itemList[NINJAGUN].image_angle)
			gnet_packet_send_to_list_exclude(_packet,global.T1_CONNECTION_ID_LIST,[m_ClientId])
			
			
			var packet = gnet_packet_build(PACKET_IDENTIFIER.T2_SELF_POSITION,x,y,m_ClientId,m_lastProcessedImput[2],hsp,vsp)
			gnet_packet_send_to_id(packet,m_ClientId)
			
			m_framesTillUpdate = m_updateFrequencyFrames + 1
		}
		
		m_framesTillUpdate --;


		break;
	}
}

#region //Server send time for individual client

if (m_updatePing = true)
{
	m_updatePing = false;
	var _time = current_time + floor(m_roundTripTime/2) //floor because faster as when dividing by 2  will always be rounded down (.0 or .5)
	var _packet = gnet_packet_build(PACKET_IDENTIFIER.T2_SEND_TIME,_time)
	gnet_packet_send_to_id(_packet,m_ClientId)
}

#endregion


