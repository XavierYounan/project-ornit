/// cb_T2_OtherPosition()
//@desc recieves information for self
var _connectionId  = argument0;
var _receivedData  = argument1;

var _x = _receivedData[0]; //buffer_s32
var _y = _receivedData[1]; //buffer_s32
var _clientId = _receivedData[2] //buffer_u8
var _lastRecievedPacket = _receivedData[3] //buffer_u64
var _hsp = _receivedData[4] //buffer_s16
var _vsp = _receivedData[5] //buffer_s16
var _state = _receivedData[6] //buffer_u8

var _client = fGetClientById(_clientId)

//if doesnt exist create a new player TODO: when player connect should be created
if (_client == noone)
{
	debug_log("Recieving position packets for self even tho not created",2)
}


with (_client) 
{
	if (isLocal)
	{
		if (hero = undefined)
		{
			debug_log("Hero was undefined, disregarding self position packet",2) 
			return;
		}
		
		with(hero)
		{
			if (_lastRecievedPacket >= latest_acknowleged_packet[2]) //make sure most recent server update
			{
				latest_acknowleged_packet = [_x,_y,_hsp,_vsp, _state] //update most recent position knowledge	
		
				O_ClientManager.m_unreadInputs = fArrayRemoveAfterElement(O_ClientManager.m_unreadInputs,2,_lastRecievedPacket) //cull unread input array
				return;
			}
			else
			{
				var str = string_build	(	"Last ack packet was {} recieved packet was {}, DROPPED",
											latest_acknowleged_packet[2],
											_lastRecievedPacket
										)				
				console_log_dropped_packet("cb_T2_SelfPosition",_connectionId,_receivedData,str)
				debug_log(str,2)
				return;
			}
		}
	}
	else
	{
		debug_log("Recieved position packet for player that was meant to be local but wasn't",2)	
		return;
	}
}
debug_log("Recieved self position packet but couldn't find player",2)
