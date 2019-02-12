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
		_client = fGetClientById(_clientId)
	}
}


with (_client) 
{
	if !(isLocal)
	{
		isLocal = true; //make local
		if (_lastRecievedPacket > latest_acknowleged_packet[2]) //make sure most recent server update
		{
			latest_acknowleged_packet = [_x,_y,_lastRecievedPacket] //update most recent position knowledge	
		
			//var fname = file_text_open_append(working_directory + "UnreadImputs.txt");
		
			//var _str = "Current Unread Imput List is" + string(O_ClientManager.m_unreadImputs)  + "\r\n"
			//file_text_write_string(fname, _str);
		
			//var _str = "Last Recieved Packet is " + string(latest_acknowleged_packet) + "\r\n"
			//file_text_write_string(fname, _str);
		
			O_ClientManager.m_unreadImputs = fArrayRemoveAfterElement(O_ClientManager.m_unreadImputs,2,_lastRecievedPacket) //cull unread imput array
		
			//var _str = "New unread Imput Array is " + string(O_ClientManager.m_unreadImputs) + "\r\n\r\n"
			//file_text_write_string(fname, _str);
			//file_text_close(fname)
	}
	}
}



/* not reall necessary is unreadable without new line
var _str = "Time: " + string(oServerTime.m_serverTime) + " Unread Imput String: " + string(O_ClientManager.m_unreadImputs) + "\r\n\r\n"
var fname = file_text_open_append(working_directory + "test.txt");
file_text_write_string(fname, _str);
file_text_close(fname)
*/

