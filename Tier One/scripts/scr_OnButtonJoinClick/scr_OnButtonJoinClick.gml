with (instance_create_depth(-10,-10,-10,O_ClientManager))
{
	IP = get_string("WHAT IS YOUR IP", "127.0.0.1")
	PORT = get_integer("WHAT IS YOUR PORT",3001)
}
room_goto(rConnecting)