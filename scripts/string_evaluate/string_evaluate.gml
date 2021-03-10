function string_evaluate( _string, _source ) {
	static __parser	= new ScriptParser();
	
	__parser.parse( _string );
	
	while ( __parser.has_next() ) {
		var _next	= __parser.next();
		var _result	= undefined;
		var _op		= function( _a, _b ) { return _b; }
		var _sec	= true;
		var _neg	= false;
		
		switch ( _next ) {
			case "+" : _op = function( _a, _b ) { return _a + _b; }; _sec = true; break;
			case "-" :
				if ( _sec == false ) {
					_op = function( _a, _b ) { return _a - _b; }; _sec = true;
					
				} else {
					_neg	= !_neg;
					
				}
				break;
				
			case "/" : _op = function( _a, _b ) { return _a / _b; }; _sec = true; break;
			case "*" : _op = function( _a, _b ) { return _a * _b; }; _sec = true; break;
			case ">" : _op = function( _a, _b ) { return _a > _b; }; _sec = true; break;
			case "<" : _op = function( _a, _b ) { return _a < _b; }; _sec = true; break;
			case "=" : _op = function( _a, _b ) { return _a = _b; }; _sec = true; break;
			default:
				if ( _neg ) {
					_result	= _op( _result, -string_find_variable( _next, _source ) );
					_neg	= false;
					
				} else {
					_result	= _op( _result, string_find_variable( _next, _source ) );
					
				}
				_sec	= false;
				
				break;
				
		}
		
	}
	return _result;
	
}
