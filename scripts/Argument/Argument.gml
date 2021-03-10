function Argument( _string ) constructor {
	static __parser	= new Parser();
	
	__parser.parse( _string );
	
	var _name	= "null";
	var _desc	= "No description";
	var _type	= "undef";
	
	if ( string_char_at( __parser.peek(), 1 ) == "{" ) {
		_type	= new Type( __parser.next() );
		
	}
	if ( __parser.has_next() ) {
		_name	= __parser.next();
		
	}
	if ( __parser.has_next() ) {
		_desc	= string_trim( __parser.remaining() );
		
	}
	name		= _name;
	description	= _desc;
	type		= _type;
	
}
