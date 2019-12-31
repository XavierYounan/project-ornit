// have a loop if you want to error a lot
var s = catch_error_dequeue();
if (s != "") {
	if (!variable_instance_exists(self, "layer")) s = string_replace_all(s, "#", chr(92)+"#");
	error_text = s;
}

