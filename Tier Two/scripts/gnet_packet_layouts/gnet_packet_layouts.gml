/**	
@desc This is a script that is empty by default but is called when the network is initialized, so you do not
	  need to call this from anywhere. Here you will define your packet layouts that will be used to pack your
	  data when you use gnet_packet_build(PacketType, data).
	  
      You should familiarize yourself with the buffer data types. Dont worry its not scary, it is how you
      can optimize the amount of bytes you send! Example data layout.
	  Packet ID integers should be between 0 - 219 since 220-255 is reserved for system level packets.

@example 
    // Example on how to define a packet made for sending x and y coordinates
	enum PacketId { pos_update = 0, death_notification }
	gnet_packet_layout_create(PacketId.pos_update, buffer_s32, buffer_s32);   
@example  
	// Example on how to define a packet made for sending a death notification of a specific client_id
	enum PacketId { pos_update = 0, death_notification }
	gnet_packet_layout_create(PacketId.death_notification, buffer_u8);
*/


			
enum PACKET_IDENTIFIER
{
	T1_KEYS = 1,	
	T2_OTHER_POSITION,
	T2_SELF_POSITION,
	T1_READY_UP,
	T2_READY_UP,
	T2_SEND_TIME
}

gnet_packet_layout_create(PACKET_IDENTIFIER.T1_KEYS,cb_T1_Imputs,buffer_s8,buffer_s8,buffer_u64)
gnet_packet_layout_create(PACKET_IDENTIFIER.T2_OTHER_POSITION,cb_T2_OtherPosition,buffer_s32,buffer_s32,buffer_u8)
gnet_packet_layout_create(PACKET_IDENTIFIER.T2_SELF_POSITION,cb_T2_SelfPosition,buffer_s32,buffer_s32,buffer_u8,buffer_u64)
gnet_packet_layout_create(PACKET_IDENTIFIER.T2_READY_UP,cb_T2_StateUpdate,buffer_bool)
gnet_packet_layout_create(PACKET_IDENTIFIER.T1_READY_UP,cb_T1_ReadyUp,buffer_bool)
gnet_packet_layout_create(PACKET_IDENTIFIER.T2_SEND_TIME,cb_T2_Time,buffer_u64)


enum MAJOR_PACKET_IDENTIFIERS
{
	T2_STATUS = 10,	

}

gnet_packet_layout_create(MAJOR_PACKET_IDENTIFIERS.T2_STATUS,cb_T2_Status,buffer_u8,buffer_u8)


