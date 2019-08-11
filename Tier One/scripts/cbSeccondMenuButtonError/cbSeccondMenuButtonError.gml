///@desc returns an error 
var errorNumber = argument0;
var values = argument1;

switch(errorNumber)
{
	case SECCOND_MENU_ERROR.MISSING_SECTION:
	{
		var ip = values[0]
		var num_sections = values[1]
		
		var str = string_build("Your ip only has {} sections!", num_sections)
		
		with(oTextboxSpawner)
		{
			with(ip_button_id)
			{
				error_message = str
			}
		}
		
		break;
	}
	
	case SECCOND_MENU_ERROR.NOT_IN_RANGE:
	{
		var ip = values[0]
		var sectionNumber = values[1]
		
		var str = string_build("Your ip for section {} is invalid!", sectionNumber)
		
		with(oTextboxSpawner)
		{
			with(ip_button_id)
			{
				error_message = str
			}
		}
		break;
	}
	
	case SECCOND_MENU_ERROR.PORT_NOT_IN_RANGE:
	{
		var numPort = values[0]
		var strPort = values[1]
		
		var str = string_build("Your port is not in range 0 to 65535, your original port {}, your adjusted port {}!",strPort,numPort)
		
		with(oTextboxSpawner)
		{
			with(port_button_id)
			{
				error_message = str
			}
		}
		break;	
	}
	
	default: 
}

