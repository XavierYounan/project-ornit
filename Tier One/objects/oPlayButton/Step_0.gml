///@desc Cover all colour change and mouse click logic
/*
	PLEASE NOTE
	code was translated from an old python PYGAME file.
	This is why it uses bounding boxes not game makes easier built in hit boxes.
	The code would have taken longer to write originally,
	But since it was already written and i didnt want to make a new sprite I went with this option.
*/

#region count down change time
backgroundColourChangeTimeLeft -= 1
#endregion

#region Check if time to change colour, if true run code inside {}
if backgroundColourChangeTimeLeft <= 0
#endregion
{
	#region Choose random colour
	var r = irandom_range(0,255)
	var g = irandom_range(0,255)
	var b = irandom_range(0,255)
	
	newBackgroundColour = [r,g,b]
	#endregion
	
	#region Make sure not repeat colour
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
	#endregion
	
	#region Make title and background colour
	titleColour = make_color_rgb(255 - originalBackgroundColour[0], 255 - originalBackgroundColour[1],255 - originalBackgroundColour[2])
	backgroundColour = make_color_rgb(originalBackgroundColour[0], originalBackgroundColour[1], originalBackgroundColour[2])
	#endregion
	
	#region reset colour change time
	backgroundColourChangeTimeLeft = backgroundColourChangeTime
	#endregion
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
#region if state nothing check if over button and change state
if buttonState = BUTTON_STATE.NOTHING
{
	if mousePos[0] > boxCoords[0]
	{
	    if mousePos[0] < boxCoords[2]
		{
	        if mousePos[1] > boxCoords[1]
			{
	            if mousePos[1] < boxCoords[3]
				{
					buttonState = BUTTON_STATE.HOVER         
				}
			}
		}
	}
}
#endregion
        
#region if state hover, ensure mouse is over point
if buttonState = BUTTON_STATE.HOVER
{
	if mousePos[0] > boxCoords[0]
	{
	    if mousePos[0] < boxCoords[2]
		{
	        if mousePos[1] > boxCoords[1]
			{
	            if mousePos[1] >= boxCoords[3]
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
#endregion

#region If state still hover check if clicked
if buttonState = BUTTON_STATE.HOVER
{
	if(mouse_check_button_pressed(mb_left))
	{
		buttonState = BUTTON_STATE.CLICKED	
	}
}
#endregion

#region if clicked check if released, if releaced make sure mouse is still over button, run script, else state is nothing
if buttonState = BUTTON_STATE.CLICKED
{
	if mouse_check_button_released(mb_left)
	{
		if mousePos[0] > boxCoords[0]
		{
		    if mousePos[0] < boxCoords[2]
			{
		        if mousePos[1] > boxCoords[1]
				{
		            if mousePos[1] < boxCoords[3]
					{
						cbFirstMenuButton(id)
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

	default: log_warn("buttonState is in defualt. This should not happen!")
}
#endregion
