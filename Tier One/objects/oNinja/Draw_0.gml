if (showingHitbox)
{
	draw_sprite(sPlayer,0,x,y)
}
else
{
	draw_self();
	draw_healthbar(x - 50,y - 100,x+50,y - 90,hp,c_black,c_red,c_green,0,true,true)
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_text(x, y-150, username)
}