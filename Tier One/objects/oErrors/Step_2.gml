/// @desc Send errors to sentry

var s = catch_error_dequeue();
if(s != "")
{
	fConsoleAddMessage("sent an exception")
	sentry_capture_exception(s);
}