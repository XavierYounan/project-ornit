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

xVel = 3 * xVel /4
yVel += grav