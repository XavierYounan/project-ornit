var socket = argument0
var recievedData = argument1

var port = recievedData[0]

var TCP_client = TCP_connectionsMap[? socket]

if TCP_client != undefined
{
	with(TCP_client)
	{
		UDP_connectionId = gnet_get_connection_id(ip,port)
	}
}

