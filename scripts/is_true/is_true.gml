/// @func is_true
/// @param returns true if a value should be considered true
function is_true( _value ) {
	if ( is_array( _value ) ) { return array_length( _value ) > 0; }
	if ( is_struct( _value ) ) { return true; }
	if ( is_method( _value ) ) { return true; }
	if ( is_string( _value ) ) { return true; }
	if ( is_numeric( _value ) && _value ) { return true; }
	
	return false;
	
}
