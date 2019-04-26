var client = argument0
var packetType = argument1
var information = argument2

var _arr = [packetType,information]

if (instance_exists(TCP_manager))
{
	var socket = TCP_manager.UDP_connectionIdMap[? client]
	var instance = TCP_manager.TCP_connectionsMap[? socket]
	
	if (instance != undefined)
	{
		ds_list_add(instance.toSendList,_arr)	
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