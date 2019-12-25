m_coordinateArray = ds_list_create() //Non local

var _array = [0,0, current_time,0,0]
ds_list_add(m_coordinateArray, _array)
		
		
m_unreadInputs = ds_list_create() //Local

//Changeable variables
grv = 480;
walksp = 240;
jump_speed = 400;
maxVsp = grv

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


