var client = argument0
var packetType = argument1
var information = argument2

var _arr = [packetType,information]

if (instance_exists(TCP_manager))
{
	var socket = TCP_manager.TCP_socketMap[? client]
	var instance = TCP_manager.TCP_connectionsMap[? socket]
	
	if (instance != undefined)
	{
		ds_list_add(instance.toSendList,_arr)	
	}
	else
	{
		fConsoleAddMessage("Tried to send packet but couldnt because TCP - UDP link is not established!",2)
	}
}
else
{
	show_error("The TCP connection has not been established",true)
}