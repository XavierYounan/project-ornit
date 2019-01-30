m_ClientId = noone;
vMove = 0

hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4;
jump_speed = 7;
hasControl = true;

hp = 100;
bulletDamage = 5;

m_readyUp = false
m_updatePing = true

m_roundTripTime = 0 //Ping

m_imputLog = []

x = room_width/2
y = room_height/2

m_x = x
m_y = y

m_latestRecievedPacket = 0

var _tempArray = [0,0,0,current_time] //oth update, usually sent by player
m_imputLog[0] = _tempArray

m_imputLogLimit = 64 //max number of entries imput log saves

enum state 
{
	playing,
	dead,
	empty,
	readyUp
}

state = state.readyUp


m_updateFrequency = 20
m_FPS = game_get_speed(gamespeed_fps)
m_updateFrequencyFrames = m_FPS/m_updateFrequency

m_framesTillUpdate = 0