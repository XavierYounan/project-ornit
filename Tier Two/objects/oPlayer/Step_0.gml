//Temp Vars
var p1,p2,bbox_side;

//Get inputs
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

//Calculate Movement
move = (key_right - key_left) * SPD_WALK
hsp = move;
vsp += SPD_GRAVITY;

// Is my middle centre touching the floor at the start of this frame

var grounded = (InFloor(tilemap, x, bbox_bottom+1) >= 0);

//Jups
if(grounded || (InFloor(tilemap,bbox_left,bbox_bottom+1) >= 0) || (InFloor(tilemap,bbox_right,bbox_bottom+1) >= 0))
{
	if(key_up)
	{
		vsp = -SPD_JUMP;
		grounded = false;
	}
	
}
 

//Re apply fractions
hsp += hsp_fraction;
vsp += vsp_fraction;

//Store and Remove fractions
//Important: go into collision with whole integers ONLY!
hsp_fraction = hsp - (floor(abs(hsp)) * sign(hsp));
hsp -= hsp_fraction;
vsp_fraction = vsp - (floor(abs(vsp)) * sign(vsp));
vsp -= vsp_fraction;


//Horizontal Collision
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
p1 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top);
p2 = tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom); 
if (tilemap_get_at_pixel(tilemap,x,bbox_bottom) > 1) p2 = 0; //ignore bottom side tiles if on a slope
if (p1 == 1) || (p2 == 1) //Inside a tile with collision
{
	if (hsp > 0) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_right - x);
	else x = x - (x mod TILE_SIZE) - (bbox_left - x);
	hsp = 0;
}
x += hsp;

//Vertical Collision
if (tilemap_get_at_pixel(tilemap,x,bbox_bottom+vsp) <=1)
{
	if (vsp >= 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	p1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+vsp) 
	p2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+vsp)
	if (p1 == 1) || (p2 == 1)
	{
		if (vsp >= 0) y = y - (y mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_bottom - y);
		else y = y - (y mod TILE_SIZE) - (bbox_top - y);
		vsp = 0;
	}
}

y += vsp; //moved this to the front

var floorDist = InFloor(tilemap,x,bbox_bottom)

if (floorDist >= 0)
{
	y -= (floorDist + 1); 
	vsp = 0;
	floorDist = -1;
}


//Walk down slope, bounce protection

if(grounded)
{
	y += abs(floorDist) -1;
	
	//if base of current tile
	if((bbox_bottom mod TILE_SIZE) == TILE_SIZE-1)
	{
		//if the slope continues 
		if(tilemap_get_at_pixel(tilemap,x,bbox_bottom+1) > 1)
		{
			//move there
			y += abs(InFloor(tilemap,x,bbox_bottom+1));
		}
	}
}





