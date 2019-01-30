///fArrayTrim()	
//@desc {array} Array The array to trim
//@desc {integer} Max The array maxium size

var _array = argument0;
var _maxSize = argument1;

var _arrayLength = array_length_1d(_array); 

if (_arrayLength <= _maxSize)
{
	return _array;	
}

else
{
	var _tempArray = []
	for(var i = 0; i < _maxSize; i ++)
	{
		_tempArray[i] = _array[i]	
	}
	return _tempArray
}