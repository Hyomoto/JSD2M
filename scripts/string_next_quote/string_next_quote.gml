/// @func string_next_quote
/// @param {string} stirng
/// @param {int} start_at
function string_next_quote( _string, _ext ) {
	for ( var _i = _ext + 1; _i < string_length( _string ); ++_i ) {
		if ( string_char_at( _string, _i ) == "\\" ) { ++_i; }
		else if ( string_char_at( _string, _i ) == "\"" ) {
			return _i;
			
		}
		
	}
	return 0;
	
}
