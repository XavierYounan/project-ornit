/// cb_ServerRecieveClientImputs()

var _connectionId  = argument0;
var _receivedData  = argument1;

var _hMove = _receivedData[0]; //buffer_s8
var _vMove = _receivedData[1]; //buffer_s8
var _packetNumber = _receivedData[2] //buffer_u64 packet number
var _mouseX = _receivedData[3] //buffer_u16
var _mouseY = _receivedData[4] //buffer_u16
var _mouseLeftClicked = _receivedData[5] //buffer_bool
var _deltaTime = _receivedData[6] //buffer_f16

var file;
file = file_text_open_append(working_directory + "deltaTimes.txt");
file_text_write_string(file, string(current_hour) + ":" + string(current_minute) + ":" + string(current_second) + ": recieved a delta from T1: " + string(_deltaTime) + "\r\n");
file_text_close(file);


var _client = fGetClientById(_connectionId)

if (_client == noone)
{
	show_error("The Server recieved an imput packet from a player that does not exist /n Connection ID : " + string(_connectionId),false)
	return;
}
else
{
	with (_client)
	{	
		if (state = state.sendingInfo)
		{
			state = state.dead
		}
		
		switch (m_character)
		{
			case CHOSEN_CHARACTER.NINJA:
			{
				hero.m_imputLog = fArrayMoveBack(m_imputLog,1)
				hero.m_imputLog[0] = [_hMove,_vMove,_packetNumber,_mouseX,_mouseY,_mouseLeftClicked,false,_deltaTime]
				break;	
			}
			
			case CHOSEN_CHARACTER.MAGNET_BOI:
			{
				hero.m_imputLog = fArrayMoveBack(m_imputLog,1)
				hero.m_imputLog[0] = [_hMove,_vMove,_packetNumber,_mouseX,_mouseY,_mouseLeftClicked,false,_deltaTime]
				break;	
			}
		}		 
	}
}

