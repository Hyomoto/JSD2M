function Argument( _string ) constructor {
	//static toString	= function() {
	//	return "|`" + name + "`|" + type + "|" + desc + "|";
		
	//}
	static _parser	= new Parser();
	
	_parser.parse( _string );
	
	name	= "";
	type	= "undef";
	desc	= "none provided";
	
	var _read	= _parser.next();
	
	// found type
	if ( string_char_at( _read, 1 ) == "{" ) {
		type	= string_copy( _read, 2, string_length( _read ) - 2 );
		name	= _parser.next();
		
	} else {
		name	= _read;
		
	}
	// read name
	// set description, if it exists
	if ( _parser.has_next() ) {
		desc	= string_trim( _parser.next_line() );
		
	}
	
}
