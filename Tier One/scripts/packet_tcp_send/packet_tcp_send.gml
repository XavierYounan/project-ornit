var ip = argument0
var port = argument1
var packetType = argument2
var information = argument3

var _arr = [packetType,information]

if (instance_exists(TCP_manager))
{
	var instance = TCP_connection_find_by_ip(ip)
	
	if (instance != noone)
	{
		with(instance)
		{
			ds_list_add(toSendList,_arr)	
		}
	}
	else
	{
		show_error("The IP doesnt not have a connection established with it",true)
	}
}
else
{
	show_error("The TCP connection has not been established",true)
}