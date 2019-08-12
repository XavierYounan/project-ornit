switch managerState
{
	case SENDINGINFO:
	{
		if sent_tcp_info == false
		{
			packet_tcp_send(global.T2_TCP_socket,TCP_PACKETS.T1_INFO,[global.gnet_myPort,m_username])
			sent_tcp_info = true;
			fConsoleAddMessage("Sent socket info")
		}
		break;
	}
	
	case PLAYING:
	{
		/* 
			Do nothing
			Previously sent imputs but now individual characters do (oMagnetBoi, oNinja)
		*/
		
		break;
	}
	
}

