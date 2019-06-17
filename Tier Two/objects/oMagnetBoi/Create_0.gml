//For debugging
showingHitbox = false

//init enums for its objects

itemList = []


vMove = 0
hsp = 0;
vsp = 0;
grv = 24;
walksp = 240 ;
jump_speed = 15;
hasControl = true;

hp = 200;
bulletDamage = 5;

fireRate = 7 //per seccond
canShoot = true

m_imputLog = []

enum PLAYERSTATE
{
	FREE,
	ATTACK_SLASH,
	ATTACK_COMBO
}

enum t1_magnetBoiState
{
	FREE = 0,
	SWING
}


playerState = PLAYERSTATE.FREE

//hitting code
hitByAttack = ds_list_create()
swingObject = undefined
swingDamage = 25