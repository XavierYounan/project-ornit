var _id = argument0
var _currentInput = argument1

with(_id)
{
	#region Unpack Variables
	
	var hButton = _currentInput[NINJA_UNREAD_INPUTS.HBUTTON]
	var vButton = _currentInput[NINJA_UNREAD_INPUTS.VBUTTON]
	var packetNumber= _currentInput[NINJA_UNREAD_INPUTS.PACKET_NUMBER]
	var gunAngle = _currentInput[NINJA_UNREAD_INPUTS.GUN_ANGLE]
	var deltaTime = _currentInput[NINJA_UNREAD_INPUTS.DELTA_TIME]
		
	
	#endregion

	//Apply horisontal player input
	var hMove = hButton * walksp * deltaTime / ONE_MILLION;	

	//Apply Gravity
	vsp += grv * deltaTime / ONE_MILLION;
	

	//Jump
	if (place_meeting(x,y+1,oWall)) && (vButton = 1)
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
}