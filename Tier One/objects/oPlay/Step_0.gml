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
			errorNumber = IP_ERROR_CODE.MISSING_SECTION
			values = [ip, _arrayLength]
		}
	
		//Loop through each of the entries and make sure it is in the propper range, if not give an error
		for (var i = 0; i <= 3; i++)
		{
			var _current = real(array[i])
		
			if !(0 <= _current <= 255)
			{
				errorNumber = IP_ERROR_CODE.NOT_IN_RANGE
				values = [ip, i+1]
				break; //Is broken to hopefully give an error at the first instance of an error 
				/*
					For example:
					192.a.10.a
					This should say that number 2 is an error rather than number 4
				*/
			}
		}
	
		//If there are no errors process the ip and start the game
		if (errorNumber = 0)
		{
			for (var i = 0; i <=2; i++)
			{
				ip += string(array[i]) + "."
			}
			ip += string(array[3])
			cbSeccondMenuButton(username, ip, port)
		}
		else //If there are errors show a message in the top that details the issue
		{
			cbSeccondMenuButtonError(errorNumber,values)
		}
		
		#endregion		
	}	
}	

