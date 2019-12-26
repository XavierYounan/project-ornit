var _keyUp = keyboard_check(ord("W"))
var _keyDown = keyboard_check(ord("S"))
var _keyLeft = keyboard_check(ord("A"))
var _keyRight = keyboard_check(ord("D"))

var _hsp = _keyRight - _keyLeft
var _vsp = _keyUp - _keyDown
			
var deltaTime = clamp(global.dt_unsteady,0,4294967295) //buffer_u32 max is 4294967295

m_unreadInput = [_hsp,_vsp,packet_number, m_gunAngle,deltaTime];	

movePlayer(id, m_unreadInput);
