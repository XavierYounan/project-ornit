//For debugging
showingHitbox = false

//init enums for its objects
enum MAGNET_BOI_ITEMS
{
	FIST_LEFT,
	FIST_RIGHT
}

itemList = []

itemList[MAGNET_BOI_ITEMS.FIST_LEFT] = instance_create_depth(x,y,-101,oMagnetFistL)
itemList[MAGNET_BOI_ITEMS.FIST_RIGHT] = instance_create_depth(x,y,-101,oMagnetFistR)

vMove = 0
hsp = 0;
vsp = 0;
grv = 24;
walksp = 240 ;
jump_speed = 15;
hasControl = true;

hp = 100;
bulletDamage = 5;

fireRate = 7 //per seccond
canShoot = true

m_imputLog = []