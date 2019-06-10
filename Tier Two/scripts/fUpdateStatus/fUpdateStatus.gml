//Called to update host status 
//Sends backet to Tier three
//Check that T3 Object exists (there is a connection)
if (instance_exists(oT3))
{
	var packet = gnet_packet_build(MAJOR_PACKET_IDENTIFIERS.T2_STATUS,array_length_1d(global.T1_CONNECTION_ID_LIST),1) //TODO SERVER STATE
	gnet_packet_send_to_id(packet,oT3.m_connectionId)
	fConsoleAddMessage("Sent number of connected players to Tier Three")
}


fConsoleAddMessage("Number of connected players is : " + string(array_length_1d(global.T1_CONNECTION_ID_LIST)))

