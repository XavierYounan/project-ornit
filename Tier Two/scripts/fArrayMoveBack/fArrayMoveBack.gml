// fArrayMoveBack()
//@desc creates a free spot in an array
//@param the array to create the free spot
//@param how many free spots to create

var _array = argument0; //import the array
var _moveAmount = argument1; //import the move amount

var _newArray = []

var _arrayLength = array_length_1d(_array);

if( _arrayLength != 0)
{
	for( var i = _arrayLength + _moveAmount - 1; i >= _moveAmount; i --)
	{
		_newArray[i] = _array[i - _moveAmount]	
	}
	
}

return (_newArray)