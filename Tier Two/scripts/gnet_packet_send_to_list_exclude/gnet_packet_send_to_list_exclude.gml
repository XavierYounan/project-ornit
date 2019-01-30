///@desc Send a packet across the network to all established connections.
///@param {Buffer} Packet The buffer containing the data to send. Generally this buffer is created with gnet_packet_build()
//@param {list} connection Id list the list of connections to send the packet to
//@param{list} The Connection Id List to exclude

var _buffer = argument0;
var _list = argument1;

var _excludeList = argument2;

var _excludeListSize = array_length_1d(_excludeList)

for (var i = 0; i < _excludeListSize; i++)
{
	_list = fArrayRemoveElement(_list,_excludeList[i])	
}

var _listSize = array_length_1d(_list)
for(var _i = 0; _i < _listSize ; _i ++)
{
	gnet_packet_send_to_id(_buffer,_list[_i])	
}

string_build("Had to shorted {} by {} result was {}",argument1,argument2,_list)