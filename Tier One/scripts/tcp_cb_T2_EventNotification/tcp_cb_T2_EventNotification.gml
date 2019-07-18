//cb_T2_LocalPlayerInfo()
var event = argument0; //buffer_u8
var client  = argument1; // buffer_u8
		
var callback = eventNotificationCallbackMap[? event]

script_execute(callback,client);
