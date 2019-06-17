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

t1_magnetBoiState_FREE = 0
t1_magnetBoiState_SWING = 1



playerState = PLAYERSTATE.FREE

//hitting code
hitByAttack = ds_list_create()
swingObject = undefined
swingDamage = 25