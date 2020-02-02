///@desc Makes sure that this instance holds singleton properies. If one of its type already exists then we
///      destroy it.
///@returns True if this instance is successfully created.

if (instance_number(object_index) > 1)
{
	instance_destroy();
	debug_log("Assert singleton destroyed an object", ERROR_LEVEL.WARNING, id)
	return false;
}

persistent = true;
return true;