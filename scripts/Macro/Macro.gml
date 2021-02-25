function Macro( _string, _header ) constructor {
	static _parser	= new Parser();
	
	_parser.parse( _string );
	syslog( _string );
	// read name
	name	= _parser.next();
	syslog( name );
	var _last = _parser.last;
	syslog( string_length( _parser ), ", ", _last );
	syslog( _parser.next_line() );
	_parser.last = _last;
	value	= string_trim( _parser.next_line() );
	desc	= ( _header == undefined ? "None provided." : _header.macro.name )
	type	= ( _header == undefined ? "undef" : _header.macro.type )
	//syslog( value );
	//syslog( desc );
	//syslog( type );
}
