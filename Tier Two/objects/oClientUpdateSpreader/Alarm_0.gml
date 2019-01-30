/// @description Reconfigure each player and reset alarm
//Reconfigure players
var _frameCount = []

var _numberOfSpots = oClient.m_updateFrequencyFrames

var i = 0
with(oClient)
{
	m_framesTillUpdate = i
	i++
	if (i >= _numberOfSpots)
	{
		i = 0	
	}
}


// Reset alarm
alarm[0] = game_get_speed(gamespeed_fps) * 8 


//Debugging 
with(oClient)
{
	_frameCount = fArrayAppend(_frameCount,m_framesTillUpdate)
}

f_ConsoleAddMessage("Update frequencys reset, now equal to : " + string(_frameCount))
