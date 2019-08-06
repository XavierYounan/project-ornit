// Establish a fake connection to get the user to accept

global.USERNAME = argument0
global.IP = argument1
global.PORT = argument2

room_goto(rConnecting)

instance_create_depth(-10, -10, 0, O_ClientManager)
