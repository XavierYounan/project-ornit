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
	
	newBackgroundColour = [r,g,b]

	/*
		Makes sure that the new colour isnt too similar to the last chosen colour
		It seems like the colours follow a pattern and this is not wanted
		If the individual RGB values are too close it will re run
		If it is close again it doesnt care
		
		Uses nested queries for faster performance
	*/
	if (originalBackgroundColour != undefined)
	{
		for(var _i = 0; _i < 3; _i ++)
		{
			if originalBackgroundColour[_i] - tooCloseColourRange < newBackgroundColour[_i] 
			{
				if 	originalBackgroundColour[_i] + tooCloseColourRange > newBackgroundColour[_i] 
				{
					newBackgroundColour[_i] = irandom_range(0,255)
				}
			}
		}
	}
	
	originalBackgroundColour = newBackgroundColour
		
	titleColour = make_color_rgb(255 - originalBackgroundColour[0], 255 - originalBackgroundColour[1],255 - originalBackgroundColour[2])
	backgroundColour = make_color_rgb(backgroundColour[0], backgroundColour[1], backgroundColour[2])
	backgroundColourChangeTimeLeft = backgroundColourChangeTime
}


#region Grow or shrink the title
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
#endregion


#region Check state of button and if button is clicked
/* 
	very complicated code but only cause created in python
	all it does is make sure the player releaces the key over the button
	It also changes colour if the mouse is hovered or clicked
	if clicked then removed from outside the play button doesnt change untill releaced where it rechecks if inside play
*/

mousePos = [mouse_x,mouse_y]

if mousePos[0] > boxCoords[0]
{
    if mousePos[0] < boxCoords[0] + boxCoords[2]
	{
        if mousePos[1] > boxCoords[1]
		{
            if mousePos[1] < boxCoords[1] + boxCoords[3]
			{
				buttonState = BUTTON_STATE.HOVER         
			}
		}
	}
}
        
if buttonState = BUTTON_STATE.HOVER
{
	if mousePos[0] > boxCoords[0]
	{
	    if mousePos[0] < boxCoords[0] + boxCoords[2]
		{
	        if mousePos[1] > boxCoords[1]
			{
	            if mousePos[1] >= boxCoords[1] + boxCoords[3]
				{
					buttonState = BUTTON_STATE.NOTHING
				}
			}
			else
			{
				buttonState = BUTTON_STATE.NOTHING
			}
		}
		else
		{
			buttonState = BUTTON_STATE.NOTHING
		}
	}
	else
	{
		buttonState = BUTTON_STATE.NOTHING
	}
}

if buttonState = BUTTON_STATE.HOVER
{
	if(mouse_check_button_pressed(mb_left))
	{
		buttonState = BUTTON_STATE.CLICKED	
	}
}


if buttonState = BUTTON_STATE.CLICKED
{
	if mouse_check_button_released(mb_left)
	{
		if mousePos[0] > boxCoords[0]
		{
		    if mousePos[0] < boxCoords[0] + boxCoords[2]
			{
		        if mousePos[1] > boxCoords[1]
				{
		            if mousePos[1] < boxCoords[1] + boxCoords[3]
					{
						scr_OnButtonJoinClick()
					}
					else
					{
						buttonState = BUTTON_STATE.NOTHING
					}
				}
				else
				{
					buttonState = BUTTON_STATE.NOTHING
				}
			}
			else
			{
				buttonState = BUTTON_STATE.NOTHING
			}
		}
		else
		{
			buttonState = BUTTON_STATE.NOTHING
		}		
	}
}
#endregion

#region Set the new button colour
switch(buttonState)
{
	case BUTTON_STATE.NOTHING:
	{
		buttonColour = titleColour
		break;	
	}
	
	case BUTTON_STATE.HOVER:
	{
		
		buttonColour = make_colour_rgb(clamp(255 - originalBackgroundColour[0] - buttonHoverDarkness,0,255), clamp(255 - originalBackgroundColour[1] - buttonHoverDarkness,0,255) , clamp(255 - originalBackgroundColour[2] - buttonHoverDarkness,0,255))
		break;	
	}
	
	case BUTTON_STATE.CLICKED:
	{
		
		buttonColour = make_colour_rgb(clamp(255 - originalBackgroundColour[0] - buttonClickDarkness,0,255), clamp(255 - originalBackgroundColour[1] - buttonClickDarkness,0,255) , clamp(255 - originalBackgroundColour[2] - buttonClickDarkness,0,255))
		break;	
	}

	default: log_error("buttonState is in defualt. This should not happen!")
}
#endregion
