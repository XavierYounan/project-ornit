m_ClientId = noone;
vMove = 0

hsp = 0;
vsp = 0;
grv = 24;
walksp = 240 ;
jump_speed = 15;
hasControl = true;

hp = 100;
bulletDamage = 5;

m_readyUp = false
m_updatePing = true

m_roundTripTime = 0 //Ping

m_imputLog = []

x = 796
y = 366

m_x = x
m_y = y

var _tempArray = [0,0,current_time,0,0,0,false] //oth update, usually sent by player
m_imputLog[0] = _tempArray
m_lastProcessedImput = _tempArray

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

//define charcter
CHARACTER = 0

//Define Ninja Items
NINJAGUN = 1

//let there be no assigned player yet
itemList[CHARACTER] = undefined

//loading functions
m_repeatTimes = 10
m_repeatFrequency = game_get_speed(gamespeed_fps)
m_timeLeft = m_repeatFrequency
m_repeatLeft = m_repeatTimes


fireRate = 7 //per seccond
canShoot = true