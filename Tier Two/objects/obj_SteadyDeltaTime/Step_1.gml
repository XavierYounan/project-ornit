/// @description  Manage Delta Timing Update

// Store previous internal delta time
dtPrevious = dt;
// Update internal delta time
dt = delta_time;
// Set raw unsteady delta time affected by time scale
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


