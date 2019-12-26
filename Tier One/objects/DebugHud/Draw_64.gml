/// @description Draw Gui Info

//import camera variables if camera exists
if(instance_exists(oCamera))
{
	var cameraX = camera_get_view_x(oCamera.camera);
	var cameraY = camera_get_view_y(oCamera.camera);
	var cameraWidth = camera_get_view_x(oCamera.camera);
	var cameraHeight = camera_get_view_y(oCamera.camera);
}
else
{
	var cameraX = 0;
	var cameraY = 0;
	var cameraWidth = 0;
	var cameraHeight = 0;
}

//var bottom = window_get_height()
var right = window_get_width()
var top = 0
var left = 0


var xSpacing		= 10;
var ySpacing		= 15;

var str, inst;

switch(debugMode)
{
	case DEBUG_MODES.CONNECTION_INFO:
	{	
		#region DebugMode Drawing
		draw_set_halign(fa_right)
		draw_text(right - xSpacing,ySpacing,"DEBUG MODE: CONNECTION_INFO")
		draw_set_halign(fa_left)
		#endregion
		
		#region Connection Info Drawing		
		for (var i = 0; i < instance_number(Connection); i++)
		{
			inst = instance_find(Connection, i);
			str  = string_build("Connection: {} | {}:{} | {}",  inst.connectionId, 
																inst.ip, 
																inst.port, 
																global.ENUM_NAME_CONNECTION_STATE[inst.connectionState]);
			draw_text(xSpacing, 10 + (i * ySpacing), str);	
		}

		i += 2; // Spacing

		var key = ds_map_find_first(NetworkManager.m_connectionMap);
	
		while (!is_undefined(key))
		{
			var _connId = NetworkManager.m_connectionMap[? key];
	
			str = key + " | " + string(_connId);
			draw_text(xSpacing, 10 + (i++ * ySpacing), str);	
		
			key = ds_map_find_next(NetworkManager.m_connectionMap, key);
		}

		i++; // Spacing

		for (a = 0; a < array_length_1d(NetworkManager.connectionSlots); a++)
		{
			var _inst = NetworkManager.connectionSlots[a];
			if (_inst != null)
				str = string_build("Slot [{}] = {} | Ping: {} | Last Update: {}", a, _inst, _inst.ping, _inst.lastUpdate);
			else
				str = string_build("Slot [{}] = {} | Ping: 0", a, _inst);
			draw_text(xSpacing, 10 + (i++ * ySpacing), str);	
		}
		i += 2; //Spacing 
		
		draw_text(xSpacing, i++ *  ySpacing, "Bytes Per Second: "   + string(NetworkManager.m_AverageBytesPerSecond));
		draw_text(xSpacing, i++ * ySpacing, "Packets Per Second: " + string(NetworkManager.m_AveragePacketsPerSecond));

		#endregion
		break;	
	}
	
	case DEBUG_MODES.CONSOLE:
	{
		#region DebugMode Drawing
		draw_set_halign(fa_right)
		draw_text(right - xSpacing,ySpacing,"DEBUG MODE: CONSOLE")
		draw_set_halign(fa_left)
		#endregion
		break;
	}
	
	case DEBUG_MODES.HITBOXES:
	{
		#region DebugMode Drawing
		draw_set_halign(fa_right)
		draw_text(right - xSpacing,ySpacing,"DEBUG MODE: HITBOXES")
		draw_set_halign(fa_left)
		#endregion
		break;
	}
	
	case DEBUG_MODES.DROPPED_PACKETS:
	{
		#region DroppedPacket Drawing
		draw_set_halign(fa_right)
		draw_text(right - xSpacing,ySpacing,"DEBUG MODE: DROPPED_PACKETS")
		draw_set_halign(fa_left)
		#endregion
		break;
	}
	
	case DEBUG_MODES.SERVER_TIME:
	{
		#region DroppedPacket Drawing
		draw_set_halign(fa_right)
		draw_text(right - xSpacing,ySpacing,"DEBUG MODE: SERVER_TIME")
		draw_set_halign(fa_left)
		#endregion
		break;
	}
	
	case DEBUG_MODES.UNREAD_PACKETS:
	{
		#region DroppedPacket Drawing
		
		//Draw the mode
		draw_set_halign(fa_right);
		draw_text(right - xSpacing,ySpacing,"DEBUG MODE: SERVER_TIME");
		draw_set_halign(fa_left);
		
		//fetch and draw the last know input
		with(oPlayer)
		{
			if(isLocal)
			{
				var lastKnown = hero.latest_acknowleged_packet;
			}
		}
		draw_text(left + xSpacing,top + ySpacing, "Last server input is : " + string(lastKnown))
		
		//fetch and draw the unread inputs
		var unreadInputs = O_ClientManager.m_unreadInputs
		var arraySize = array_length_1d(unreadInputs)
		
		for(i = 0; i < arraySize; i++)
		{
			draw_text(left + xSpacing,top + ((i + 2) * ySpacing),string(unreadInputs[i]))
		}
		
		#endregion
		break;
	}
}



