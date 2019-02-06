enum state 
{
	playing,
	dead,
	empty,
	readyUp
}

state = state.empty

latest_acknowleged_packet = [0,0,0]
isLocal = false;

m_coordinateArray = []



vMove = 0

hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4;
jump_speed = 7;
hasControl = true;

hp = 100;
bulletDamage = 5;
