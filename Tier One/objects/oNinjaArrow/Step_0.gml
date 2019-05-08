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

_colInst = instance_place(x,y,oNinja)

if (_colInst == noone) 
{
	return;
}

if(_colInst.parent.m_PlayerId != creator) 
{
	instance_destroy(self)	
	return;
}

/*
if (_colInst != noone) && (_colInst.m_PlayerId != creator) 
{
	instance_destroy(self)	
}
*/