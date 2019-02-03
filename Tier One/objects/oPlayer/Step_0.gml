switch isLocal
{
	case isLocal = true:
	{
		
	
		break;
	}
	
	case isLocal = false:
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
		
			      var t0 = old_position[2];
			      var t1 = new_position[2];

			      x = x0 + (x1 - x0) * (render_timestamp - t0) / (t1 - t0);
		  
				  y = y0 + (y1 - y0) * (render_timestamp - t0) / (t1 - t0);
			}
		}
		break;
	}
		
}



