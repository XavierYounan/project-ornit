var _array = argument0;
//disregard first one as it is just the name of the command, this was just easy for my lazy ass
//motherfucker is a string make sure use real
var _lagRate = real(_array[1]) //get the client id from the array 

if(instance_exists(oLagger))
{
	global.lagRate = _lagRate;	
}