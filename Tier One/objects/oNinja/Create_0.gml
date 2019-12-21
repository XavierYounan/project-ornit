m_coordinateArray = []

//Changeable variables
grv = 24;
walksp = 240;
jump_speed = 15;

maxVsp = 30;

hp = 100;

hasControl = true;

showingHitbox = false

parent = null

enum NINJA_ITEMS
{
	GUN	
}

itemList = []

itemList[NINJA_ITEMS.GUN] = instance_create_depth(0,0,-101,oNinjaGun)
