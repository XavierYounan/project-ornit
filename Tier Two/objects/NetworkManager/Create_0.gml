/// @description Basic Vars

m_PacketsThisSecond = 0;
m_BytesThisSecond   = 0;

m_AveragePacketsPerSecond = 0;
m_AverageBytesPerSecond   = 0;

alarm[0] = room_speed;

instance_create_depth(-100, -100, -1000, DebugHud);

var _PacketErrorsFile
_PacketErrorsFile =  file_text_open_write(working_directory + "\packetErrors.txt");
file_text_write_string(_PacketErrorsFile,"Opened Sucessfully! /n/r/n/r")
file_text_close(_PacketErrorsFile);