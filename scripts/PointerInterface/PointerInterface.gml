/// @func PointerInterface
/// @param {(#InputShape)}	shape	The shape of this input interface
/// @desc	An abstract interface for building pointers, see (#PointerSimpleMouse) for an example of how
//		to extend it into a concrete implementation.
function PointerInterface( _shape ) constructor {
	static change_state	= function( _state, _event ) {
		if ( state != _state ) {
			state	= _state;
			
			if ( _event != undefined ) {
				_event();
				
			}
			
		}
		
	}
	static update	= function( _x, _y, _exit ) {
		if ( _exit == true || shape.inside( _x, _y ) == false ) {
			return false;
			
		} else {
			return true;
			
		}
		
	}
	/// @desc The internal Shape.
	shape	= undefined;
	
	if ( is_struct_of( _shape, Shape ) ) {
		shape	= _shape;
		
	} else {
		PointerManager().log( instanceof( self ), ": Invalid type provided, must be a Shape." );
		shape	= new Shape();
		
	}
	
}
