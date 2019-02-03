/// cb_T2_OtherPosition()
//@desc recieves information for self
var _connectionId  = argument0;
var _receivedData  = argument1;

var _x = _receivedData[0]; //buffer_s32
var _y = _receivedData[1]; //buffer_s32
var _clientId = _receivedData[2] //buffer_u8
var _lastRecievedPacket = _receivedData[3] //buffer_u64

var _client = fGetClientById(_clientId)