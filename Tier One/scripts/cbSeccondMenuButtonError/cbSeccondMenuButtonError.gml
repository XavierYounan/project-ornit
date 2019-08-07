///@desc returns an error 
var errorNumber = argument0;
var values = argument1;

switch(errorNumber)
{
	case IP_ERROR_CODE.MISSING_SECTION:
	{
		var ip = values[0]
		var num_sections = values[1]
		
		var str = string_build("Your ip only has {} sections!", num_sections)
		break;
	}
	
	case IP_ERROR_CODE.NOT_IN_RANGE:
	{
		var ip = values[0]
		var sectionNumber = values[1]
		
		var str = string_build("Your ip for section {} is invalid!", sectionNumber)	
		break;
	}
	
	default: 
}

with(oTextboxSpawner)
{
	with(ip_button_id)
	{
		error_message = str
	}
}