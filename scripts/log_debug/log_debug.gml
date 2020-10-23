/// @func log_debug
/// @param {intp}	id			the source instance, should be an instance
/// @param {string}	event		the name of the event that should be logged
/// @param {mixed}	values...	any number of values
/// @desc Writes `values...` to the system output when ERROR_LEVEL >= ERROR_DEBUG
/// @example
//log_debug( id, "load", "Could not load, ", _value, ". File doesn't exist." )
/// @wiki Core-Index Logging
function log_debug( _id, _event ) {
	if ( ERROR_LEVEL >= ERROR_DEBUG ) {
		static instance	= new Logger( "debug", FAST_LOGGER_DEFAULT_LENGTH, System );
		
		var _string	= ( is_undefined( _id ) ? "" : string( _id ) ) + " [" + _event + "] ";
		
		var _i = 2; repeat( argument_count - 2 ) {
			_string	+= string( argument[ _i++ ] );
			
		}
		instance.write( _string );
		
	}
	
}
