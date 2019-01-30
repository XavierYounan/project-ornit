// fArrayRemoveElement()
//@desc removes an element from an array and resizes
//@param array the array to remove the element from
//@param element the element to remove

//@returns condensed array or empty array

var _array = argument0
var _element = argument1

var _arraySize = array_length_1d(_array) //gets the size of the array

var _numbElement = 0

for(var i = 0; i < _arraySize; i++) //count how many elements there are
{
	if (_element = _array[i])
	{
		_numbElement ++;
	}
}

if(_numbElement = _arraySize)
{
	return [];	
}
else
{
	repeat(_numbElement) //removes the first element matching it sees and condenses
	{
		_array = fArrayRemoveSingleElement(_array,_element);
	}
}

return _array;

