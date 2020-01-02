if(! catch_error_init() > 0)
{
	fConsoleAddMessage("catch error failed to initialise")
}
catch_error_set_prompt(catch_error_prompt_message,
    "We regret to inform that the game encountered a fatal error and will now close.",
    "Error");




if(! sentry_init("https://fe51e4b37356486da7f212bb61434516@sentry.io/1869212") > 0)
{
	fConsoleAddMessage("sentry failed to initialise")
}

instance_create_depth(-10, -10, DEPTH.GUI, oErrors)

room_goto_next()