/// @description Draw Button

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, m_Color, 1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var xAlign = sprite_width / 2;
var yAlign = sprite_height / 2;

if (m_Font != noone)
	draw_set_font(m_Font);
draw_text_ext_transformed_color(x + xAlign, y + yAlign, m_DefaultText, -1, -1, image_xscale, image_yscale, image_angle, m_FontColor, m_FontColor, m_FontColor, m_FontColor, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);