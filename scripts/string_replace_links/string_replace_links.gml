/// @func string_replace_tags
function string_replace_links( _string, _source ) {
	var _var; repeat( string_count( "{#", _string ) ) {
		var _meta	= ( function(_string, _at ) { var _open	= string_pos( "{#", _string ); var _close	= string_pos_ext( "}", _string, _open ); if ( not _open || not _close ) { return undefined; } return { tag: string_copy( _string, _open + 2, _close - _open - 2 ), pos: _open, count: _close - _open + 1 }; })( _string );
		
		if ( _meta == undefined ) { break; }
		
		var	_var	= string( "[" + _meta.tag + "](" + _meta.tag + ")" );
		syslog( _var );
		_string	= string_delete( _string, _meta.pos, _meta.count );
		_string	= string_insert( _var, _string, _meta.pos );
		
	}
	return string_count( "{#", _string ) > 0 ? string_replace_links( _string, _source ) : _string;
	
}
