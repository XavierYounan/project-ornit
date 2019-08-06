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
		
		#region Check that the ip is valid
		
		array = stringSplit(ip,".")
		
		var _arrayLength = array_length_1d(array)
	
		if (_arrayLength != 4)
		{
			show_message("You are missing a section. Try again!. Your ip was " + string(ip) + "Doesnt seem right? Tell Xavier error code 2 and your ip")
		}
	
		for (var i = 0; i <= 3; i++)
		{
			var _current = real(array[i])
		
			if !(0 <= _current <= 255)
			{
				i = 10 //break the for loop
				show_message("You entered the ip wrong, its gotta be between 0 and 255 for every section. Section " + string(i+1) + " was wrong at " + string(_current))
				break;
			}
		}
	
		if (i != 10)
		{
			for (var i = 0; i <=2; i++)
			{
				global.IP = global.IP + string(array[i]) + "."
			}
			global.IP += string(array[3])
		}
		else
		{
			show_message("Tell Xavier error code 1 and your ip: " + string(ip) + " i is " + string(i))
		}
		
		#endregion
		
		cbSeccondMenuButton(username, ip, port)
		
	}	
}	

#region Ip check
/*
global.IP = ""

while (global.IP == "")
{
	var tempIp = get_string("WHAT IS YOUR IP", "127.0.0.1")
	
	
	
	var _arrayLength = array_length_1d(array)
	
	if (_arrayLength != 4)
	{
		show_message("You are missing a section. Try again!. Your ip was " + string(tempIp) + "Doesnt seem right? Tell Xavier error code 2 and your ip")
		break;
	}
	
	for (var i = 0; i <= 3; i++)
	{
		var _current = real(array[i])
		
		if !(0 <= _current <= 255)
		{
			i = 10 //break the for loop
			show_message("You entered the ip wrong, its gotta be between 0 and 255 for every section. Section " + string(i+1) + " was wrong at " + string(_current))
		}
	}
	
	if (i != 10)
	{
		for (var i = 0; i <=2; i++)
		{
			global.IP = global.IP + string(array[i]) + "."
		}
		global.IP += string(array[3])
	}
	else
	{
		show_message("Tell Xavier error code 1 and your ip: " + string(tempIp) + " i is " + string(i))
	}
}
*/
#endregion