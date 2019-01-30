///@desc Send a packet across the network to all established connections.
///@param {Buffer} Packet The buffer containing the data to send. Generally this buffer is created with gnet_packet_build()
//@param {list} connection Id list the list of connections to send the packet to

var _buffer = argument0;
var _list = argument1;

var _listSize = array_length_1d(_list)

for(var _i = 0; _i < _listSize ; _i ++)
{
	gnet_packet_send_to_id(_buffer,_list[_i])	
}