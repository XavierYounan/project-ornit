if (!assert_singleton()) return;
x = 0;
y = 0;

m_GameConsole = instance_create_depth(-10,-10,-100,oConsole)

MAX_PLAYERS = 9999;

enum SERVER_STATES
{
	LOADING = 1,
	
}
var result = gnet_start_network(MAX_PLAYERS,PROTOCOL_ID,3002, "MAJOR SERVER")

if (!result)
{
	show_message("The provided port may not be open, could not initalise network!");
	instance_destroy();
	return;
}
else
{
	cb_onSuccessfullNetworkCreation()
}

m_drawBuffer = 10
