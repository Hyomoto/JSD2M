function Type( _string ) constructor {
	static toString	= function() {
		return type;
		
	}
	type	= string_copy( _string, 2, string_length( _string ) - 2 );
	
}
