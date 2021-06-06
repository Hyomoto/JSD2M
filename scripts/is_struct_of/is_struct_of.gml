/// @func is_struct_of
/// @param {struct}	struct		The struct to check
/// @param {type}	constructor	The constructor to check parentage of.
function is_struct_of( _struct, _const ) {
	if ( is_struct( _struct ) ) {
		if ( typeof( _const ) == "number" && instanceof( _struct ) == script_get_name( _const ) ) { return true; }
		if ( variable_struct_exists( _struct, "is" ) ) { return _struct.is( _const ); }
		
	}
	return false;
	
}
