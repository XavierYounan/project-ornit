// cb_T2_Time
//@desc find the latency and server time offset
var _connectionId  = argument0;
var _receivedData  = argument1;

var _time = _receivedData[0]; //buffer_u64 value will not hit max untill 5849424 centuarys, data heavy


if (!instance_exists(oServerTime))
{
	fConsoleAddMessage("Couldnt find oServerTime, NOT SYNCING TIME, connectionId: " + string(_connectionId))
}
with (oServerTime) //oServerTime is singleton
{
	m_serverTimeOffset = _time - current_time;	// if T2 was created 10 milisecconds before T1 will be 10
	m_timesUpdated ++ //For debugging 
}

