if (showingHitbox)
{
	draw_sprite(sMagnetBoi,0,x,y)
}
else
{
	draw_self();
	draw_healthbar(x - 50,y - 100,x+50,y - 90,hp/2,c_black,c_red,c_green,0,true,true)
}