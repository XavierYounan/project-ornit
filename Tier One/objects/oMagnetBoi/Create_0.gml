m_coordinateArray = []


//Changeable variables
grv = 24;
walksp = 200;
jump_speed = 13;

hp = 200;
fistDamage = 30;

hasControl = true;

showingHitbox = false

enum MAGNET_BOI_ITEMS
{
	FIST_LEFT,
	FIST_RIGHT
}

itemList = []

itemList[MAGNET_BOI_ITEMS.FIST_LEFT] = instance_create_depth(0,0,101,oMagnetFistL)
itemList[MAGNET_BOI_ITEMS.FIST_RIGHT] = instance_create_depth(0,0,101,oMagnetFistR)