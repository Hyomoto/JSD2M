function string_find_variable( _string, _source ) {
	static __parser		= new Parser(".");
	
	__parser.parse( _string );
	
	try {
		var _var	= _source[$ __parser.next() ];
		
		while ( __parser.has_next() ) {
			_var	= _var[$ __parser.next() ];
			
		}
		
	} catch ( _ ) {
		return undefined;
		
	}
	return _var;
	
}
