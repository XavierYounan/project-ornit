/// @desc Will return a client instance with a client id mathcing the given argument
/// @param {integer} ClientId The clientId to search for

var _clientId = argument0

with (oClient)
{
	if(m_ClientId == _clientId) 
	return id;	
}
return noone;