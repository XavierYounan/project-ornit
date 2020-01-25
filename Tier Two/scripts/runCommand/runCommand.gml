/// runCommand(command)
{
    var command = argument[0];	//bring in the command
    var array = stringSplitter(command, " ");	//split the command 
    if (string_length(array[0]) > 0) //make sure there is stuf to the command
    {
        if (string_char_at(array[0], 1) == "/") 		//make sure theres a backslash
        {
            array[0] = string_delete(array[0], 1, 1); 	//get rid of the backslash
			array[0] = "command_" + array[0]
            var scriptIndex = asset_get_index(array[0]);	//fidn the asset index of the command
            if (script_exists(scriptIndex))					//check the command exists
            {
                script_execute(scriptIndex, array);		//run the commadn and return as a string
            }
            else
            {
				array[0] = string_delete(array[0],1,string_length("command_"))
                debug_log("Unknown command " + string(array[0]));			//if the command cannot be round reurn unknown
            }
        }
    }
}