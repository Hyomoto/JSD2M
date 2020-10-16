/// @func string_to_func
/// @param string
/// @desc	converts string to an array of function and named arguments
function string_to_func( _string ) {
	var _p	= string_pos( "(", _string );
	var _n	= string_copy( _string, 1, _p - 1 );
	
	_string	= strd( _string, 1, _p );
	
	var _a	= string_explode( strc( _string, 1, string_pos( ")", _string ) - 1 ), ",", true );
	var _r	= array_create( 1 + array_length( _a ) );
	
	_r	= [ _n, _a ];
	
	return _r;
	
}