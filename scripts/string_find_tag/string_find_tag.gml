/// @func string_find_tag()
/// @param {string} string
/// @returns {string} string
/// @desc	Returns the @tag, if present, on the provided string, or `undefined` if nothing was found.
function string_find_tag( _string ) {
	_string		= string_trim( _string );
	
	if ( string_copy( _string, 1, 3 ) == "///" ) {
		_string	= strd( _string, 1, 3 );
		
	} else if ( string_copy( _string, 1, 2 ) == "//" ) {
		_string	= strd( _string, 1, 2 );
		
	} else {
		return undefined;
		
	}
	if ( string_copy( _string, 1, 1 ) != "@" ) {
		return undefined;
		
	}
	var _snip	= string_find_first( " \t", _string, 0 );
	
	return ( _snip == 0 ? [ _string, "" ] : [ string_copy( _string, 1, _snip - 1 ), strd( _string, 1, _snip ) ] );
	
}
