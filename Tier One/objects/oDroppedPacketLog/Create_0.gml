if (!assert_singleton()) return;

m_droppedPacketList = ds_list_create();
m_maxMessages = 20;

displayingText = false