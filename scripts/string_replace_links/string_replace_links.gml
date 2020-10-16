function string_replace_links( _string ) {
	static next_tag	= function( _string ) {
		var _open	= string_pos( "(#", _string );
		
		if ( _open == 0 ) { return undefined; }
		
		var _close	= string_pos_ext( ")", _string, _open );
		
		if ( _close == 0 ) { return undefined; }
		
		return [ string_copy( _string, _open + 2, _close - _open - 2 ), _open, _close ];
		
	}
	while ( true ) {
		var _tag	= next_tag( _string );
		
		if ( _tag == undefined ) { break; }
		
		_string	= string_copy( _string, 1, _tag[ 1 ] - 1 ) + "[" + _tag[ 0 ] + "](" + wikiPath + _tag[ 0 ] + string_delete( _string, 1, _tag[ 2 ] - 1 );
		
	}
	return _string;
	
}
