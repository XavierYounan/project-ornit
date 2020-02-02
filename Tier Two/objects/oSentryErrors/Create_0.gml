#region Setup catch error

catch_error_init();

//show_debug_message("ready? " + string(catch_error_is_ready())); //change to log debug

catch_error_set_prompt(catch_error_prompt_question,
    @"This wonderful little game encountered an error.
Would you like to restart the program and view the error?",
    "Oh no,");
	
	
catch_error_set_normal(catch_error_normal_queue);
catch_error_set_fatal(catch_error_fatal_queue);


error_file = "misc/error.log";
catch_error_set_dump_path(error_file);


// let the program restart itself on error
var argv = "", argc = parameter_count();
for (var i = 1; i < argc; i++) {
    if (i > 1) argv += " ";
    var v = parameter_string(i);
    if (string_pos(" ", v)) argv += @'"' + v + @'"'; else argv += v;
}
catch_error_set_exec(parameter_string(0), argv);


error_text = "";
if (file_exists(error_file)) {
    var buf = buffer_load(error_file);
    error_text = buffer_read(buf, buffer_string);
    buffer_delete(buf);
    file_delete(error_file);
}

#endregion


if(! sentry_init("https://d0dd13b276d141d2a872632a70da0715@sentry.io/1909623") > 0)
{
	priv_console_add_message("sentry failed to initialise", ERROR_LEVEL.ERROR)
}