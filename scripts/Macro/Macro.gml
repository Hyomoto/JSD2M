function Macro( _string, _header ) constructor {
	static _parser	= new Parser();
	
	_parser.parse( _string );
	
	// read name
	name	= _parser.next();
	value	= string_trim( _parser.next_line() );
	desc	= ( _header == undefined ? "None provided." : _header.macro.name )
	type	= ( _header == undefined ? "undef" : _header.macro.type )
	
}
