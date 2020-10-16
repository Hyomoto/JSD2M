/// @func string_split_next
/// @param {string} string
/// @param {string} split	a string of chars to search for
/// @returns array
function string_split_next( _string, _chars ) {
	var _split	= string_find_first( _chars, _string, 0 );
	
	if ( _split == 0 ) { return [ _string ]; }
	
	return [ strc( _string, 1, _split - 1 ), strd( _string, 1, _split ) ];
	
}
