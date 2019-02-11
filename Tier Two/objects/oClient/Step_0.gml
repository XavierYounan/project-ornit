var _str = "Imput Log is " + string(m_imputLog) + "\r\n\r\n"
var fname = file_text_open_append(working_directory + "test.txt");
file_text_write_string(fname, _str);
file_text_close(fname)


switch state
{
	case state.readyUp:
	{
		m_lastProcessedImput = m_imputLog[0]
		m_imputLog = []
		
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
		#region //Clear imput log
			m_lastProcessedImput = m_imputLog[_arraySize-1]
		
			m_imputLog = []
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
		#region //Bullet Collosion

			var _bulletsTouching;
			_bulletsTouching = instance_place(x, y, oBullet);
			if (_bulletsTouching != noone)
			{   
				hp -= O_Client.bulletDamage;
				with (oBullet) instance_destroy();
			}
			
		#endregion
		#region //Animation

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

			if (hsp != 0) image_xscale = sign(hsp);
		#endregion
		}
		
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