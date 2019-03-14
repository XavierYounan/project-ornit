if (hitDelay < 0)
{
	if(place_meeting(x,y,oWall))
	{
		instance_destroy(self)	
		fConsoleAddMessage("Hit wall DESTROYED")
	}
}
else
{
	hitDelay--	
}	
_colInst = instance_place(x,y,oPlayer)

if (_colInst != noone) && (_colInst.m_PlayerId != creator) 
{
	fConsoleAddMessage("creator : " + string(creator) + " player id " + string(_colInst.m_PlayerId) + " DESTROYED")
	instance_destroy(self)	
}
