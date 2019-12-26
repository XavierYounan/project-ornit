var _id = argument0
var _currentInput = argument1

with(_id)
{
	
	#region Unpack Variables
	
	var hKeys = _currentInput[IMPUTLIST.HORISONTAL_KEYS]
	var vKeys = _currentInput[IMPUTLIST.VERTICAL_KEYS]
	
	var mouseX = _currentInput[IMPUTLIST.MOUSE_X]
	var mouseY = _currentInput[IMPUTLIST.MOUSE_Y]
	var mouseLeftClicked = _currentInput[IMPUTLIST.MOUSE_LEFT_CLICKED]
	
	var deltaTime = _currentInput[IMPUTLIST.DELTA_TIME]
	var packetNumber= _currentInput[IMPUTLIST.PACKET_NUMBER]
	
	#endregion

	//Apply horisontal player input
	var hMove = hKeys * walksp * deltaTime / ONE_MILLION;	

	//Apply Gravity
	vsp += grv * deltaTime / ONE_MILLION;
	
	//Jump
	if (place_meeting(x,y+1,oWall)) && (vKeys = 1)
	{
		vsp = -jump_speed	
	}

	//clamp vsp
	vsp = clamp(vsp, -maxVsp, maxVsp)
	
	
	//Calculate vMove
	var vMove = vsp * deltaTime / ONE_MILLION;

	//Horisontal collision
	if (place_meeting(x + hMove, y,oWall))
	{
		while (!place_meeting(x+sign(hMove),y,oWall))
		{
			x += sign(hMove);	
		}
		hMove = 0;
	}
	x += hMove;

	//Vertical collision
	if (place_meeting(x,y+vMove,oWall))
	{
		while (!place_meeting(x,y+sign(vMove),oWall))
		{
			y += sign(vMove);	
		}
		vMove = 0;
		vsp = 0;
	}
	y += vMove;
	
	if (hMove != 0) image_xscale = sign(hMove);
				
	with (itemList[NINJA_ITEMS.GUN])
	{
		x = other.x;
		y = other.y - 20;
	
		image_angle = point_direction(x,y, mouseX, mouseY)
				
		other.parentId.mouse_angle = image_angle
	}
				
	if ((mouseLeftClicked) && (canShoot)) //if mouse left clicked and this frame hasnt been processed yet and can shoot
	{
				
		canShoot = false
		alarm[0] = room_speed/fireRate
		//create bullet
		with(instance_create_depth(x,y - 20,-102,oNinjaBullet))
		{
			direction = other.itemList[NINJA_ITEMS.GUN].image_angle	
			image_angle = direction - 90
			creator = other.parentClientId
					
			var buff = gnet_packet_build(PACKET_IDENTIFIER.T2_CREATE_ENTITY,creator,x,y,direction,ENTITY.NINJA_ARROW)
			gnet_packet_send_to_list(buff,global.T1_CONNECTION_ID_LIST)
		}
	}
}		