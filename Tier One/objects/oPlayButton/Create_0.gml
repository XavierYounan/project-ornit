///@desc Init all the vairables

/*
	PLEASE NOTE
	code was translated from an old python PYGAME file.
	This is why it uses bounding boxes not game makes easier built in hit boxes.
	The code would have taken longer to write originally,
	But since it was already written and i didnt want to make a new sprite I went with this option.
*/

enum FONT_STATE
{
	GROWING,
	SHRINKING
}

backgroundColourChangeTime = 2 * game_get_speed(gamespeed_fps)
backgroundColourChangeTimeLeft = 0

titleFontSizeMin = 150
titleFontSizeMax = 300
titleFontSize = titleFontSizeMin
titleFontState = FONT_STATE.GROWING

titleBoxCenterOffset = 150
titleBoxThickness = [300,80]

roomHeightStart = room_height
roomWidthStart = room_width

boxCoords = [roomWidthStart/2-titleBoxThickness[0]/2,roomHeightStart/2 - titleBoxThickness[1]/2 + titleBoxCenterOffset, roomWidthStart/2+titleBoxThickness[0]/2,roomHeightStart/2 + titleBoxThickness[1]/2 + titleBoxCenterOffset]
