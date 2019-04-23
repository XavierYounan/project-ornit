var socket = argument0
var packetType = argument1
var information = argument2

var _arr = [packetType,information]

if (instance_exists(TCP_manager))
{
	var instance = TCP_manager.socket_instance_map[? socket]

	if (instance != undefined)
	{
		with(instance)
		{
			ds_list_add(to_send_list,_arr)	
		}
	}
	else
	{
		show_error("That socket doesnt not have a connection established with it",true)
	}
}
else
{
	show_error("The TCP connection has not been established",true)
}