//For debugging
showingHitbox = false

//init enums for its objects
enum NINJA_ITEMS
{
	GUN
}

itemList = []

itemList[NINJA_ITEMS.GUN] = instance_create_depth(x,y,-101,oNinjaGun)

vMove = 0
hsp = 0;
vsp = 0;

grv = 6;
walksp = 240;
jump_speed = 420;


hasControl = true;

hp = 100;
bulletDamage = 5;

fireRate = 7 //per seccond
canShoot = true

m_imputLog = []


//Eventaully add a enum
playerState = 0

stunned = false
slowed = false
slow_percentage = 0.5 
