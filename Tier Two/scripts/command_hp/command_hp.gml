var _array = argument0;
//disregard first one as it is just the name of the command, this was just easy for my lazy ass

var _clientId = real(_array[1]) //get the client id from the array 
var _hp = real(_array[2]) //get the x from the array

_client = fGetClientById(_clientId)

if (_client != noone)
{
	with(_client)
	{
		hp = _hp	
		
	}
	return "Gave client " + string(_clientId) + " hp of " + string(_hp)
}
else
{
	return "Could not find client with id of " + string(_clientId)	
}