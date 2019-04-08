var ip = argument0
var port = argument1
var packetType = argument2
var information = argument3

var _arr = [ip,port,packetType,information]

if (instance_exists(TCP_manager))
{
	ds_list_add(toSendList,_arr)
}
else
{
	show_error("The TCP connection has not been established",true)
}