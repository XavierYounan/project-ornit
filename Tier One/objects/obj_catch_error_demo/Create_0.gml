catch_error_init();

show_debug_message("ready? " + string(catch_error_is_ready()));
catch_error_set_prompt(catch_error_prompt_question,
    @"This wonderful little demo encountered an error.
Would you like to restart the program and view the error?",
    "Oh no,");
	
	
catch_error_set_normal(catch_error_normal_queue);
catch_error_set_fatal(catch_error_fatal_queue);


//Sets the fatal error log file to misc/error.log
error_file = "misc/error.log";
catch_error_set_dump_path(error_file);


// Restarts the program on an error
var str = "", 
var p_count = parameter_count();

for (var i = 1; i < p_count; i++) 
{
    if (i > 1) 
	{
		str += " ";
	}
    var v = parameter_string(i);
	
    if (string_pos(" ", v)) 
	{
		str += @'"' + v + @'"';
	}
	else 
	{
		str += v;
	}
}
catch_error_set_exec(parameter_string(0), str);

/*
	Finds out if an error file is present
	If it has this means that a fatal error occured 
	Read the messsage
	Process it
	Delete the file
*/

error_text = "";
if (file_exists(error_file)) {
    var buf = buffer_load(error_file);
    error_text = buffer_read(buf, buffer_string);
    buffer_delete(buf);
    file_delete(error_file);
}