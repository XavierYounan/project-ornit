if (hitDelay < 0)
{
	if(place_meeting(x,y,oWall))
	{
		instance_destroy(self)	
	}
}
else
{
	hitDelay--	
}	

_colInst = instance_place(x,y,oPlayer)

if (_colInst != noone) && (_colInst.m_PlayerId != creator) 
{
	instance_destroy(self)	
}
