function safe_throw( _error, _attributes ){
	var _exception	= "exception";
	var _script		= "unknown";
	var _message	= "unknown";
	var _stack		= undefined;
	
	if ( not is_struct( _error ) ) {
		if ( is_numeric( _error ) && script_exists( _error ) ) {
			_exception	= script_get_name( _error );
			_message	= script_execute_ext( _error, ( is_array( _attributes ) ? _attributes : [ _attributes ] ));
			
		} else {
			_message	= _error;
			
		}
		var _stack	= debug_get_callstack();
		var _meta	= string_explode( _stack[ 1 ], ":", false );
		
		_script	= _meta[ 0 ] + "(near line " + _meta[ 1 ] + ")";
		
	} else {
		_message	= _error.message;
		_script		= _error.stacktrace[ 0 ];
		
	}
	ERROR.notify( string_con( "ERROR! Caught ", _exception, " in ", string( _script ), " :: ", string( _message ) ) );
	
}
