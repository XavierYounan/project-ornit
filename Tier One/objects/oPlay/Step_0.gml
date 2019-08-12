error = false //begin checks


if(position_meeting(mouse_x,mouse_y,id))
{
	if(mouse_check_button_released(mb_left))
	{
		with(parent)
		{
			other.username = textboxValues[? "Username"]
			other.ip = textboxValues[? "Ip"]
			other.port = textboxValues[? "Port"]
		}
		
		errorNumber = 0
		values = []
		
		#region Check that the ip is valid
		//Break the array up by the delimiter . and put into array
		array = stringSplit(ip,".")
		
		//Find the number of enetries (should be four)
		var _arrayLength = array_length_1d(array)
	
		//Check that there are four, if not give an error
		if (_arrayLength != 4)
		{
			errorNumber = SECCOND_MENU_ERROR.MISSING_SECTION
			values = [ip, _arrayLength]
			
			error = true
			cbSeccondMenuButtonError(errorNumber,values)
		}
		
		//Loop through each of the entries and make sure it is in the propper range, if not give an error
		for (var i = 0; i <= _arrayLength-1; i++)
		{
			/*
				String digits removes any letters from the ip
				Eventually make it so you cant type letters when typing your ip
			*/
			var stringDigits = string_digits(array[i]);			
			var _current = real(stringDigits)
		
			if(0 <= _current && _current <= 255)
			{
				//Do nothing is valid
		
			}
			else
			{
				errorNumber = SECCOND_MENU_ERROR.NOT_IN_RANGE
				values = [ip, i+1]
					
				error = true
				cbSeccondMenuButtonError(errorNumber,values)
				break; //Is broken to hopefully give an error at the first instance of an error 
				/*
					For example:
					192.a.10.a
					This should say that number 2 is an error rather than number 4
				*/
			}
		}
		
		#endregion
		
		#region Check that the port is valid
		var stringDigits = string_digits(port);			
		var numPort = real(stringDigits)
		
		if (0 <= numPort && numPort <= 65535)
		{
			//Do nothing is valid
		}
		else
		{
			error = true
			errorNumber = SECCOND_MENU_ERROR.PORT_NOT_IN_RANGE
			values = [numPort]
			cbSeccondMenuButtonError(errorNumber,values)
		}
		
		#endregion
		
		
	
		//If there are no errors process the ip and start the game
		if (error = false)
		{
			cbSeccondMenuButton(username, ip, numPort)
		}			
	}	
}	

