/// @func OldInterface
/// @param Shape
function OldInterface( _shape ) constructor {
	static change_state	= function( _state, _event ) {
		if ( other.state != _state ) {
			other.state	= _state;
			
			if ( _event != undefined ) {
				_event();
				
			}
			
		}
		
	}
	static update	= function() {
		if ( shape.inside( mouse_x, mouse_y ) ) {
			if ( mouse_check_button( mb_left ) ) {
				change_state( STATE_DOWN, onDown );
				
			} else if ( mouse_check_button_released( mb_left ) ) {
				change_state( STATE_UP, onUp );
				
			} else {
				change_state( STATE_HOVER, onEnter );
				
			}
			return true;
			
		} else {
			change_state( STATE_UP, onLeave );
			
			return false;
			
		}
		
	}
	shape	= _shape;
	onDown	= undefined;
	onUp	= undefined;
	onEnter	= undefined;
	onLeave	= undefined;
	
}
