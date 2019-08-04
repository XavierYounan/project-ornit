// Establish a fake connection to get the user to accept
var _id = argument0

gnet_start_network(1,PROTOCOL_ID,3111, "temp connection")
gnet_stop_network()

/// @description get ip and port and init
clicked = false; //init
image_speed = 0; //init

global.IP = ""

while (global.IP == "")
{
	var tempIp = get_string("WHAT IS YOUR IP", "127.0.0.1")
	
	array = stringSplit(tempIp,".")
	
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

global.PORT = get_integer("WHAT IS YOUR PORT",3001)

global.USERNAME = "harry is bad at brawl stars"
global.USERNAME = get_string("USERNAME", "harry is bad at brawl stars")

room_goto(rConnecting)


instance_create_depth(-10, -10, 0, O_ClientManager)



instance_destroy(_id)
