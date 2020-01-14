/// @desc Sends error messages to sentry
var s = catch_error_dequeue();
while (s != "") {

	sentry_capture_exception(s);
	
    s = catch_error_dequeue();
}
