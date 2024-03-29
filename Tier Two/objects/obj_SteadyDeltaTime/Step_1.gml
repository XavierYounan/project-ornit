/// @description  Manage Delta Timing Update

// Store previous internal delta time
dtPrevious = dt;
// Update internal delta time
dt = delta_time;
// Set raw unsteady delta time affected by time s
global.dt_unsteady = dt*scale;

// Prevent delta time from exhibiting sporadic behaviour
if (dt > 1/minFPS * ONE_MILLION)
{
    if (dtRestored) 
    { 
        dt = 1/minFPS * ONE_MILLION; 
    } 
    else 
    { 
        dt = dtPrevious;
        dtRestored = true;
    }
}
else
{
    dtRestored = false;
}

// Assign internal delta time to global delta time affected by the time scale
global.dt_steady = dt*scale;


/*
var file;
file = file_text_open_append(working_directory + "deltaTimes.txt");
file_text_write_string(file,string(current_hour) + ":" + string(current_minute) + ":" + string(current_second) + + " New frame, delta time : " + string(global.dt_unsteady) + " \n\r");
file_text_write_string(file,string(current_hour) + ":" + string(current_minute) + ":" + string(current_second) + + " dt Counter: serverDeltaTime:ClientDeltaTime " + string(_server) + ":" + string(_client) + " \n\r\n\r");
file_text_close(file);
*/