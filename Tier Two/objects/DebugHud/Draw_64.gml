
/// @description Draw Gui Info
var connectionInfoX = 10;
var dataStructsX = window_get_width() / 2;
var ySpacing        = 15;

var str, inst;

switch(debugMode)
{
	case DEBUG_MODES.HITBOXES:
	{
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_halign(fa_right)
		draw_text(room_width - textBuffer,textBuffer,"DEBUG MODE: HITBOXES")
		draw_set_halign(fa_left)
		break;
	}
	
	case DEBUG_MODES.CONNECTION_INFO:
	{
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_halign(fa_right)
		draw_text(room_width - textBuffer,textBuffer,"DEBUG MODE: CONNECTION INFO")
		draw_set_halign(fa_left)
		
		#region Connection Info Drawing
		draw_set_color(c_white);
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
		#endregion
	
		draw_text(connectionInfoX,10 + ( i++ * ySpacing), "Bytes Per Second: "   + string(NetworkManager.m_AverageBytesPerSecond));
		draw_text(connectionInfoX,10 + ( i++ * ySpacing), "Packets Per Second: " + string(NetworkManager.m_AveragePacketsPerSecond));

		break;
	}
	
	case DEBUG_MODES.DROPPED_PACKETS:
	{
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_halign(fa_right)
		draw_text(room_width - textBuffer,textBuffer,"DEBUG MODE: DROPPED PACKETS")
		draw_set_halign(fa_left)
		
		var _listSize = ds_list_size(droppedPacketsList);
		var _yAnchor = window_get_height() - 10; //CHANGE TO VARIABLE PIXELS FROM LEFT
		var _spacing = 30; //CHANGE TO FONT HEIGHT PLUS GAP

		draw_set_colour(c_white)
		for (var i = _listSize - 1; i > -1; i--)
		{
			//unpack array
			var array = droppedPacketsList[| i];
			
			var str = string_build("Packet Type: {}, Recieved from connection id {}, Recieved Data {}", array[|1], array[|2], array[|3])
			draw_text(10, _yAnchor - ((_listSize - i) * _spacing),str);
		}
		break;
		
	}
		
	case DEBUG_MODES.NOTHING:
	{
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_halign(fa_right)
		draw_text(room_width - textBuffer,textBuffer,"DEBUG MODE: NOTHING")
		draw_set_halign(fa_left)
	break;
	}
}


