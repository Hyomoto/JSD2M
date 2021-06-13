function Variable( _string ) constructor {
	static __parser	= new Parser();
	
	__parser.parse( _string );
	
	var _desc	= "No description";
	var _type	= "undef";
	
	if ( string_char_at( __parser.peek(), 1 ) == "{" ) {
		_type	= new Type( __parser.next() );
		
	}
	if ( __parser.has_next() ) {
		_desc	= string_trim( __parser.remaining() );
		
	}
	desc	= _desc;
	type	= _type;
	
}
