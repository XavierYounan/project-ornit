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

if (_colInst != noone) && (_colInst.m_ClientId != creator) 
{
	with (_colInst)
	{
		hp -= bulletDamage;
		instance_destroy(other)
	}
}
