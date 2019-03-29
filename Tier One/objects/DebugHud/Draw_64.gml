/// @description Draw Gui Info

//import camera variables if camera exists
if(instance_exists(oCamera))
{
	var cameraX = global.cameraX;
	var cameraY = global.cameraY;
	var cameraWidth = global.cameraWidth;
	var cameraHeight = global.cameraHeight;
}
else
{
	var cameraX = 0;
	var cameraY = 0;
	var cameraWidth = 0;
	var cameraHeight = 0;
}

var xSpacing		= 10;
var connectionInfoX	= xSpacing + cameraX;
var ySpacing		= 15;

var str, inst;

switch(debugMode)
{
	case DEBUG_MODES.CONNECTION_INFO:
	{	
		#region DebugMode Drawing
		draw_set_halign(fa_right)
		draw_text(cameraX + cameraWidth - xSpacing,ySpacing,"DEBUG MODE: CONNECTION_INFO")
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
			draw_text(connectionInfoX, 10 + (i * ySpacing), str);	
		}

		i += 2; // Spacing

		var key = ds_map_find_first(NetworkManager.m_connectionMap);
	
		while (!is_undefined(key))
		{
			var _connId = NetworkManager.m_connectionMap[? key];
	
			str = key + " | " + string(_connId);
			draw_text(connectionInfoX, 10 + (i++ * ySpacing), str);	
		
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
			draw_text(connectionInfoX, 10 + (i++ * ySpacing), str);	
		}
		
		draw_text(cameraX + xSpacing, ySpacing, "Bytes Per Second: "   + string(NetworkManager.m_AverageBytesPerSecond));
		draw_text(cameraX + xSpacing, 4 * ySpacing, "Packets Per Second: " + string(NetworkManager.m_AveragePacketsPerSecond));

		#endregion
		break;	
	}
	
	case DEBUG_MODES.CONSOLE:
	{
		#region DebugMode Drawing
		draw_set_halign(fa_right)
		draw_text(cameraX + cameraWidth - xSpacing,ySpacing,"DEBUG MODE: CONSOLE")
		draw_set_halign(fa_left)
		#endregion
		break;
	}
	
	case DEBUG_MODES.HITBOXES:
	{
		#region DebugMode Drawing
		draw_set_halign(fa_right)
		draw_text(cameraX + cameraWidth - xSpacing,ySpacing,"DEBUG MODE: HITBOXES")
		draw_set_halign(fa_left)
		#endregion
		break;
	}
}


