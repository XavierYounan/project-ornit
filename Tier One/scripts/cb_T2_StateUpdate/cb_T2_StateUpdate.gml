/// cb_T2_StateUpdate ()
//@desc set the state for players
var _connectionId  = argument0;
var _receivedData  = argument1;

var _state = _receivedData[0];

//Loop through every player, set state to playing
with(oPlayer)
{
	state = _state
}
