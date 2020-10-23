/// @func PointerSimpleMouse
function PointerSimpleMouse( _shape ) : PointerSimpleMouse( _shape ) constructor {
	// # constants
	// # constants
	static INPUT_NONE	= 0;
	static INPUT_HOVER	= 1;
	static INPUT_UP		= 2;
	static INPUT_DOWN	= 3;
	static INPUT_HELD	= 4;
	
	static update_PointerIterface	= update;
	static update	= function( _x, _y ) {
		if ( update_PointerInterface( _x, _y ) && mouse_check_button( mb_left ) ) {
			if ( state == INPUT_NONE ) {
				change_state( INPUT_HOVER, onEnter );
				
			}
			if ( mouse_check_button_pressed( mb_left ) ) {
				change_state( INPUT_DOWN, onDown );
				
			} else if ( mouse_check_button( mb_left ) ) {
				change_state( INPUT_HELD, onHeld );
				
			} else if ( mouse_check_button_released( mb_left ) ) {
				change_state( INPUT_UP, onUp );
				
			}
			return true;
			
		} else {
			change_state( INPUT_NONE, onLeave );
			
			return false;
			
		}
		
	}
	/// @desc The function to perform while the mouse button is held
	onHeld	= undefined;
	/// @desc The function to perform when the mouse is pressed
	onDown	= undefined;
	/// @desc The function to perform when the mouse is released
	onUp	= undefined;
	
}
