function Type( _string ) constructor {
	static toString	= function() {
		return type;
		
	}
	static __safety__	= new Array(["int","struct","method","real","string","float","bool","array","mixed","self","other"]);
	
	type	= string_copy( _string, 2, string_length( _string ) - 2 );
	
	if ( __safety__.contains( type ) > -1 ) {
		type	= "`" + type + "`";
		
	} else {
		type	= "[" + type + "](" + string_lower( type ) + ")";
		
	}
	
}
