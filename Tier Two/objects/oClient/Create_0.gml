m_ClientId = noone;

m_readyUp = false
m_updatePing = true

m_roundTripTime = 0 //Ping

m_imputLog = []

x = -10
y = -10

m_x = x
m_y = y

m_imputLog = []

m_lastProcessedImput = undefined

enum state 
{
	playing,
	dead,
	readyUp,
	error,
	waitingForInfo,
	sendingInfo,
}

state = state.waitingForInfo


//T1 STATES MAKE SURE YOU BRING THE OVER EVERY TIME
t1state_PLAYING = 0
t1state_DEAD = 1
t1state_RECIEVINGINFO = 2
t1state_READYUP = 3


m_updateFrequency = 20
m_FPS = game_get_speed(gamespeed_fps)
m_updateFrequencyFrames = m_FPS/m_updateFrequency

m_framesTillUpdate = 0

enum character
{
	nil,
	ninja,
	gunner
}

m_username = ""
m_character = character.nil

//let there be no assigned player yet
hero = undefined

//loading functions
m_repeatTimes = 10
m_repeatFrequency = game_get_speed(gamespeed_fps)
m_timeLeft = m_repeatFrequency
m_repeatLeft = m_repeatTimes


showingHitbox = false //for the debug hud