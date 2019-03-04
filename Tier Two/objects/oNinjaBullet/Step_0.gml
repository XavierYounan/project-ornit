if(place_meeting(x,y,oWall))
{
	instance_destroy(self)	
}

with(place_meeting(x,y,oClient))
{
	hp -= bulletDamage;
	instance_destroy(other)
}