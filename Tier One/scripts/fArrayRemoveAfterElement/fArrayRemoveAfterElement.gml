/// fArrayRemoveAfterElement()
// @desc used when a T1 can clear acklonedged imputs

// @param {array} Array the array to shorten
// @param {int} The sub array index number to check
// @param {value} The value to check for 

var array = argument0
var index = argument1
var value = argument2

var arrayLength = array_length_1d(array)

for(var i = 0; i < arrayLength; i++)
{
	var subArray = array[i]
	var arrayValue = subArray[index]
	if (value == arrayValue)
	{
		var tempArray = []
		for(var el = 0; el < i; el++)
		{
			tempArray[el] = array[el]	
		}
		return tempArray
	}
}