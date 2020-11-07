/// @func PointerStack
/// @param {(#PointerInterface)}	interfaces...	The interfaces to attach to this stack, this can also be another PointerStack.
/// @desc	The PointerStack is used to create a list of (#PointerInterface)s that will be traversed in
//		descending order to ensure only the top-most element is called. Thus, interfaces that are added
//		later will be "above" those that were added earlier.  In the given example, the second simple
//		mouse pointer would be called rather than the first where the two overlap.
/// @example
//pointer = new PointerStack( 0, 0, room_width, room_height )
//
//pointer.add( new PointerSimpleMouse( new ShapeRectangle( 10, 10, 20, 20 ) );
//pointer.add( new PointerSimpleMouse( new ShapeRectangle( 20, 20, 20, 20 ) );
function PointerStack( _x, _y, _w, _h ) constructor {
	/// @desc Calls for this PointerInterface to be updated, will check all instances and update the
	//		top-most interface that it finds. Any previous interactions will have their exit code
	//		called as well.
	static update	= function( _x, _y, _exit ) {
		if ( _exit != true || point_in_rectangle( _x, _y, x, y, x + w - 1, y + h - 1 ) ) {
			var _i = array_length( content ); repeat( array_length( content ) ) {
				if ( content[ --_i ].update( _x, _y ) ) {
					if ( last != undefined ) {
						last.update( _x, _y, true );
						
					}
					last	= content[ _i ];
					
					break;
					
				}
				
			}
			return true;
			
		} else if ( last != undefined ) {
			last.value.update( _x, _y, true );
			last	= undefined;
			
		}
		return false;
		
	}
	/// @param {mixed}	interface	A (#PointerInterface) or (#PointerStack).
	/// @desc Removes the specified interface from the stack.
	static remove	= function( _value ) {
		var _i = 0; repeat( array_length( content ) ) {
			if ( content[ _i++ ] == _value ) {
				array_delete( content, _i - 1, 1 );
				
				return;
				
			}
			
		}
		PointerManager().log( "PointerStack.remove() : The provided value was not found." );
		
	}
	/// @param {mixed}	interface	A (#PointerInterface) or (#PointerStack).
	/// @desc Adds the specified interface to the stack.
	static add		= function( _value ) {
		if ( is_struct_of( _value, PointerInterface ) || is_struct_of( _value, PointerStack ) ) {
			array_push( content, _value );
			
		} else {
			PointerManager().log( "PointerStack.add() : Invalid type provided, must be a PointerInterface or PointerStack." );
			
		}
		return _value;
		
	}
	static is	= function( _data_type ) {
		return _data_type == PointerStack;
		
	}
	/// @desc The last interface to be interacted with.
	last	= undefined;
	/// @desc The internal array of Interfaces being used.
	content	= [];
	/// @desc The x position of the PointerStack.
	x		= _x;
	/// @desc The y position of the PointerStack.
	y		= _y;
	/// @desc The width of the PointerStack.
	w		= _w;
	/// @desc The height of the PointerStack.
	h		= _h;
	
}
