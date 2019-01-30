/// fArrayRemoveSingleElement()

//@param array the array to remove the element from
//@param element the element to remove

//@desc for use in multiple removals cleans up code quite nicely

//@returns removed array

//@example a = fArrayRemoveSingleElement(a,5)
//@desc removes 5 from array a

var _array = argument0
var _element = argument1

var _i = 0
var _tempArray = []

while(_array[_i] != _element)
{	
	_tempArray[_i] = _array[_i]
	_i++
}

var _arraySize = array_length_1d(_array);

for(var _index = _i; _index < _arraySize-1; _index++)
{
	_tempArray[_index] = _array[_index + 1]
}

return _tempArray
