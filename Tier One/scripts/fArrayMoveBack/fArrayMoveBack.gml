// fArrayMoveBack()
//@desc creates a free spot at the front of an array
//@param the array to create the free spot
//@param how many free spots to create



var _oldArray = argument0; //get array
var _moveAmount = argument1; //get move amount

var _originalArrayLength = array_length_1d(_oldArray);
var _newArray = []

for(var i = _moveAmount; i < _originalArrayLength - 1 + _moveAmount ; i++)
{
	_newArray[i] = _oldArray[i - _moveAmount]
}

return (_newArray)
