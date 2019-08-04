///@desc Draw the background, box, title and play text

/*
	PLEASE NOTE
	code was translated from an old python PYGAME file.
	This is why it uses bounding boxes not game makes easier built in hit boxes.
	The code would have taken longer to write originally,
	But since it was already written and i didnt want to make a new sprite I went with this option.
*/

//Draw background
draw_set_colour(backgroundColour)
draw_rectangle(0, 0, room_width, room_height, false)

//Draw button
draw_set_color(buttonColour)
draw_rectangle(boxCoords[0], boxCoords[1], boxCoords[2], boxCoords[3], false)

//Draw play text
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(backgroundColour)
scale = 2
draw_text_transformed(boxCoords[0]/2 + boxCoords[2]/2 , boxCoords[1]/2 + boxCoords[3]/2, "Play", scale, scale, 0);


//Draw title text
draw_set_color(titleColour)
scale = titleFontSize/200

/*
	200 is the size of the font in the fonts section.
	This means that the font size max and min variables in the create section are accurate 
	200 was chosen so could be the highest quality
	On the texture page only the leters from brawlers were imported (b,r,a,w,l,r and s)
	Texture page will not be full
	Might be affected if more texts are added
*/

draw_set_font(fFirstMenuTitle)
draw_text_transformed(room_width/2, room_height/2 - 100, "Brawlers", scale, scale, 0);
draw_set_font(fMain)
       