enum PLAYER_STATE
{
	PLAYING,
	DEAD,
	RECIEVING_INFO,
}

enum PLAYER_EVENT
{
	PLAYING,
	DEAD,
	RECIEVING_INFO,	
}

m_character = CHARACTER.NULL

m_username = ""
hero = undefined

isLocal = false;

event_user(PLAYER_EVENT.RECIEVING_INFO)