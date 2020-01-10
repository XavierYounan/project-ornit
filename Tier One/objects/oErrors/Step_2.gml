/// @desc Send errors to sentry
var s = catch_error_dequeue();
if (s != "") {
	if (!variable_instance_exists(self, "layer")) s = string_replace_all(s, "#", chr(92)+"#"); //not too sure what this does
	sentry_capture_exception(s);
}

