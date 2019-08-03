///@desc Cover all colour change and mouse click logic
/*
	PLEASE NOTE
	code was translated from an old python PYGAME file.
	This is why it uses bounding boxes not game makes easier built in hit boxes.
	The code would have taken longer to write originally,
	But since it was already written and i didnt want to make a new sprite I went with this option.
*/

backgroundColourChangeTimeLeft -= 1
if backgroundColourChangeTimeLeft <= 0
{
	var r = irandom_range(0,255)
	var g = irandom_range(0,255)
	var b = irandom_range(0,255)
	
	backgroundColour = [r,g,b]
	titleColour = make_color_rgb(255 - backgroundColour[0], 255 - backgroundColour[1],255 - backgroundColour[2])
	backgroundColour = make_color_rgb(backgroundColour[0], backgroundColour[1], backgroundColour[2])
	backgroundColourChangeTimeLeft = backgroundColourChangeTime
}

if titleFontState = FONT_STATE.GROWING
{
	titleFontSize += 1
    if titleFontSize >= titleFontSizeMax
	{
		titleFontState = FONT_STATE.SHRINKING
	}
}

if titleFontState = FONT_STATE.SHRINKING
{
    titleFontSize -= 1
    if titleFontSize <= titleFontSizeMin
	{
        titleFontState = FONT_STATE.GROWING
	}
}

mousePos = [mouse_x,mouse_y]

if mousePos[0] > boxCoords[0]
{
    if mousePos[0] < boxCoords[0] + boxCoords[2]
	{
        if mousePos[1] > boxCoords[1]
		{
            if mousePos[1] < boxCoords[1] + boxCoords[3]
			{
                if mouse_check_button_released(mb_left)
				{
					scr_OnButtonJoinClick()
				}          
			}
		}
	}
}
                
