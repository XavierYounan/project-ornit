enum State 
{
	playing,
	dead,
	loading,
	readyUp,
}

state = State.loading

enum characters
{
	nil,
	ninja,
	gunner
}

m_username = ""
m_character = characters.nil

latest_acknowleged_packet = [0,0,0]
isLocal = false;

m_coordinateArray = []

vMove = 0

hsp = 0;
vsp = 0;
grv = 18;
walksp = 240;
jump_speed = 7;
hasControl = true;

hp = 100;
bulletDamage = 5;


