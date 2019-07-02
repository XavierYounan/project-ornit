if (dissapear = true)
{
	alpha -= 0.01	
	
	if alpha < 0
	{
		instance_destroy(self)	
	}
}

x += xVel
y += yVel

xVel = 99 * xVel/100
yVel += grav