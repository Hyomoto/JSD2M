add_message( "", APP_NAME + " " + APP_VERSION + " by Devon Mullane" );

ERROR.add( function( _text ) {
	add_message( "error", _text );
	
});
LOGGER.add( function( _text ) {
	add_message( _text[0], _text[1] );
	
});
