/// cb_T2_OtherPosition()
//@desc recieves information for self
var _connectionId  = argument0;
var _receivedData  = argument1;

var _x = _receivedData[0]; //buffer_s32
var _y = _receivedData[1]; //buffer_s32
var _clientId = _receivedData[2] //buffer_u8
var _lastRecievedPacket = _receivedData[3] //buffer_u64

var _client = fGetClientById(_clientId)



//if doesnt exist create a new player TODO: when player connect should be created
if (_client == noone)
{
	with (instance_create_depth(x,y,10,oPlayer))
	{
		m_PlayerId = _clientId
		isLocal = true;
		latest_acknowleged_packet = [_x,_y,_lastRecievedPacket] //update most recent position knowledge	
	}
}


with (_client) 
{
	isLocal = true; //make local
	if (_lastRecievedPacket > latest_acknowleged_packet) //make sure most recent server update
	{
		latest_acknowleged_packet = [_x,_y,_lastRecievedPacket] //update most recent position knowledge		
		O_ClientManager.m_unreadImputs = fArrayRemoveAfterElement(O_ClientManager.m_unreadImputs,2,_lastRecievedPacket) //cull unread imput array
	}
}
