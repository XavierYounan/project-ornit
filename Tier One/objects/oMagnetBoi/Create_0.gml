m_coordinateArray = []


//Changeable variables
grv = 24;
walksp = 200;
jump_speed = 13;

hp = 200;

hasControl = true;

showingHitbox = false

itemList = []

enum MAGNET_BOI_STATE
{
	FREE,
	ATTACK_SLASH,
	ATTACK_COMBO
}

state = PLAYERSTATE.FREE

//hitting code
hitByAttack = ds_list_create()
swingObject = undefined
swingDamage = 25
