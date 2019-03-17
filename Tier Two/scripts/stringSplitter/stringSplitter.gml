/// stringSplit(string, delimiter)
{
    var delimiter = argument[1];
    var theString = argument[0] + delimiter;

    var delimiterLength = string_length(delimiter);
    var count = string_count(delimiter, theString);
    var position = 0;
    
    var returnArray;
    
    for (var i = 0; i < count; ++i)
    {
        position = string_pos(delimiter, theString) - 1;
        returnArray[i] = string_copy(theString, 1, position);
        theString = string_delete(theString, 1, position + delimiterLength);
    }

    return returnArray;
}