/**
@desc **System Callback**
      This is called when a response has been receieved from a sent Connection Request 
	  
* FRAMEWORK NOTE: *This is CALLED FROM Connection -> USER EVENT 3*
*/
///@param {Enum} ConnectionAddResult The add result receieved
///@param {Number} ConnectionId The connectionId that sent the message
var _connectionResult = argument0;
var _connectionId     = argument1;

// Your code here. 

switch (_connectionResult)
{
	case ConnectionAddResult.AlreadyConnected:
		// Code Here. For some reason this connection is already connected to the attempted connection
		show_error("Already connected to T3",true)
	break;
	case ConnectionAddResult.MaxPlayer:
		// Code Here. You got a response that the address you tried to connect to is full.
		show_error("Server T3 is full",true)
	break;
	case ConnectionAddResult.Success:
		// Code Here. Your connection was successfull. _connectionId is populated with an id! Save it or something
		
		//delete the major server client object and create server object
		_client = fGetClientById(_connectionId)
		
		//remove the major server from the client connection list
		global.T1_CONNECTION_ID_LIST = fArrayRemoveElement(global.T1_CONNECTION_ID_LIST,_connectionId)
		
		//add the T3 connection to the T3 connection list
		global.T3_CONNECTION_ID_LIST = fArrayAppend(global.T3_CONNECTION_ID_LIST,_connectionId)
	
		instance_destroy(_client)
		
		with (instance_create_depth(0,0,0,oT3))
		{
			m_connectionId = _connectionId;	
		}
		
		//Log some information
		f_ConsoleAddMessage("T3 Server Id is : " + string(_connectionId))
		
		//Send server information
		fUpdateStatus()
		
		//goto the connecting room
		room_goto_next()
	break;
}

