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
	T1_NINJA,
	T2_NINJA,
	T2_NINJA_LOCAL,
	
	T1_MAGNET_BOI,
	T2_MAGNET_BOI,
	T2_MAGNET_BOI_LOCAL,
	
	T2_CREATE_ENTITY,
	T2_HEALTH_STUN_UPDATE,
	
	T2_SEND_TIME,	
}


gnet_packet_layout_create(PACKET_IDENTIFIER.T1_NINJA, cb_T1_Ninja, buffer_s8,buffer_s8,buffer_u64,buffer_u16,buffer_u16,buffer_bool,buffer_f32)
gnet_packet_layout_create(PACKET_IDENTIFIER.T2_NINJA,cb_T2_Ninja,buffer_s32,buffer_s32,buffer_u8,buffer_u16, buffer_u8)
gnet_packet_layout_create(PACKET_IDENTIFIER.T2_NINJA_LOCAL,cb_T2_NinjaLocal,buffer_s32,buffer_s32,buffer_u8,buffer_u64,buffer_s16,buffer_s16, buffer_u8)

gnet_packet_layout_create(PACKET_IDENTIFIER.T1_MAGNET_BOI, cb_T1_MagnetBoi, buffer_s8, buffer_s8, buffer_u64, buffer_u16, buffer_u16, buffer_bool, buffer_f32)
gnet_packet_layout_create(PACKET_IDENTIFIER.T2_NINJA,cb_T2_MagnetBoi,buffer_s32,buffer_s32,buffer_u8,buffer_u16, buffer_u8)
gnet_packet_layout_create(PACKET_IDENTIFIER.T2_NINJA_LOCAL,cb_T2_MagnetBoiLocal,buffer_s32,buffer_s32,buffer_u8,buffer_u64,buffer_s16,buffer_s16, buffer_u8)

gnet_packet_layout_create(PACKET_IDENTIFIER.T2_CREATE_ENTITY, cb_T2_CreateEntity, buffer_u8, buffer_s32, buffer_s32, buffer_u16, buffer_u8)
gnet_packet_layout_create(PACKET_IDENTIFIER.T2_HEALTH_STUN_UPDATE,cb_T2_HealthStunUpdate,buffer_u8,buffer_u8, buffer_bool, buffer_bool) 	

gnet_packet_layout_create(PACKET_IDENTIFIER.T2_SEND_TIME,cb_T2_Time,buffer_u64)
