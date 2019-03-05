if (hitDelay >= 0)
{
	hitDelay --
}
else
{
	if(place_meeting(x,y,oWall))
	{
		instance_destroy(self)	
	}

	_colInst = instance_place(x,y,oClient)

	if(_colInst != noone)
	{
		with (_colInst)
		{
			hp -= bulletDamage;
			instance_destroy(other)
		}
	}
}