///fArrayAppend()
//@desc Add a value to the end of an array

//@param array the array to append
//@param value the value to append

var _array = argument0;
var _value = argument1;

var _arraySize = array_length_1d(_array);
_array[_arraySize] = _value;

return _array;