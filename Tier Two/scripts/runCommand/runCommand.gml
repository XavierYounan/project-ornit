/// runCommand(command)
{
    var command = argument[0];	//bring in the command
    var array = stringSplitter(command, " ");	//split the command 
    if (string_length(array[0]) > 0) //make sure there is stuf to the command
    {
        if (string_char_at(array[0], 1) == "/") 		//make sure theres a backslash
        {
            array[0] = string_delete(array[0], 1, 1); 	//get rid of the backslash
            var scriptIndex = asset_get_index(array[0]);	//fidn the asset index of the command
            if (script_exists(scriptIndex))					//check the command exists
            {
                return  string(script_execute(scriptIndex, array));		//run the commadn and return as a string
            }
            else
            {
                return  "Unknown command.";			//if the command cannot be round reurn unknown
            }
        }
    }
}