if( keyboard_check_pressed( vk_f1))
{
	switch(debugMode)
	{
		case DEBUG_MODES.CONSOLE:
		{
			#region Console code
			//Console destroy event
			O_GameConsole.displayingText = false
			
			//Switch the state
			debugMode = DEBUG_MODES.HITBOXES
			
			//Hitboxes create event
			with (pDisplayHitboxes)
			{
				showingHitbox = true	
			}
			
			#endregion
			break;
		}

		case DEBUG_MODES.HITBOXES:
		{
			#region Hitboxes code
			//Hitboxes distroy event
			with (pDisplayHitboxes)
			{
				showingHitbox = false	
			}
			
			//switch the state
			debugMode = DEBUG_MODES.CONNECTION_INFO
			
			//Connection info create event
			//nothing yet
		
			#endregion
			break;
		}
		
		case DEBUG_MODES.CONNECTION_INFO:
		{
			#region Connection info code
			//Connection info
			//nothing yet
			
			//switch the state
			debugMode = DEBUG_MODES.DROPPED_PACKETS
			
			//dropped Packets create event
			droppedPacketLog.displayingText = true
			
			#endregion
			break;	
		}
		
		case DEBUG_MODES.DROPPED_PACKETS:
		{
			#region Dropped packets code
			//dropped Packets destroy event
			droppedPacketLog.displayingText = false
			
			//Switch the state
			debugMode = DEBUG_MODES.SERVER_TIME
			
			//Server time create event
			with(oServerTime) {showDebug = true;}
			
			#endregion
			break;
		}
		
		case DEBUG_MODES.SERVER_TIME:
		{
			#region Server time code
			
			//Server time destroy event
			with(oServerTime) {showDebug = false;}
			
			//switch the state
			debugMode = DEBUG_MODES.UNREAD_PACKETS
			
			//unread Packets Create event_action
			//nothing
			
			#endregion
			break;
		}
		
		case DEBUG_MODES.UNREAD_PACKETS:
		{
			#region Server time code
			
			//unread_packets destroy event destroy event
			//nothing
			
			//switch the state
			debugMode = DEBUG_MODES.CONSOLE
			
			//Console create event
			O_GameConsole.displayingText = true
			
			#endregion
			break;
		}
	}
}