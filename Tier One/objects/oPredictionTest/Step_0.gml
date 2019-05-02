var _unreadListSize = array_length_1d(m_unreadImputs)

if (_unreadListSize != 0)
{
	for (var i = _unreadListSize - 1; i >= 0; i--)
	{
		var _currentImput = m_unreadImputs[i];
		
		var _deltaTime = _currentImput[UNREAD_IMPUTS.DELTA_TIME]
		
		hsp = _currentImput[UNREAD_IMPUTS.HSP] * walksp * _deltaTime / ONE_MILLION;
		
		vMove = _currentImput[UNREAD_IMPUTS.VSP];
		
		vsp += grv * _deltaTime / ONE_MILLION;

		//Jump
		if (place_meeting(x,y+1,oWall)) && (vMove = 1)
		{
			vsp = -jump_speed	
		}

		//Horisontal collision
		if (place_meeting(x+hsp,y,oWall))
		{
			while (!place_meeting(x+sign(hsp),y,oWall))
			{
				x += sign(hsp);	
			}
			hsp = 0;
		}
		x += hsp;

		//Vertical collision
				
		if (place_meeting(x,y+vsp,oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y += sign(vsp);	
			}
			vsp = 0;
		}
		y += vsp;
	}
}

m_unreadImputs = [] //clear the imput logs

//-------------------------------------------------------------------
var _keyUp = keyboard_check(ord("W"))
var _keyDown = keyboard_check(ord("S"))
var _keyLeft = keyboard_check(ord("A"))
var _keyRight = keyboard_check(ord("D"))

var hsp_key = _keyRight - _keyLeft
var vsp_key = _keyUp - _keyDown

local_hsp = hsp_key * walksp * global.dt_steady / ONE_MILLION
		
local_vsp += grv * global.dt_steady / ONE_MILLION
		
local_vsp = clamp(local_vsp,-maxSpeed,+maxSpeed)

//Jump
if (place_meeting(normXY[0],normXY[1] + 1,oWall)) && (vsp_key = 1)
{
	local_vsp = -jump_speed	
}

//Horisontal collision
if (place_meeting(normXY[0] + local_hsp,normXY[1],oWall))
{
	while (!place_meeting(normXY[0]+sign(local_hsp),normXY[1],oWall))
	{
		normXY[0] += sign(local_hsp);	
	}
	local_hsp = 0;
}
normXY[0] += local_hsp;

//Vertical collision
				
if (place_meeting(normXY[0],normXY[1]+local_vsp,oWall))
{
	while (!place_meeting(normXY[0],normXY[1]+sign(local_vsp),oWall))
	{
		normXY[1] += sign(local_vsp);	
	}
	local_vsp = 0;
}
normXY[1] += local_vsp;
