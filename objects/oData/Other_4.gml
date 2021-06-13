var _ini	= ini_open( "pref.ini" );

loadPath	= ini_read_string( "paths", "load", working_directory );
savePath	= ini_read_string( "paths", "save", working_directory );
wikiPath	= ini_read_string( "paths", "wiki", "" )

objects		= ini_read_string( "settings", "objects", "true" ) == "true" ? true : false;
constructors= ini_read_string( "settings", "constructors", "true" ) == "true" ? true : false;
functions	= ini_read_string( "settings", "functions", "true" ) == "true" ? true : false;

textbox_load.set_text( loadPath );
textbox_save.set_text( savePath );
textbox_wiki.set_text( wikiPath );

oButtonSaveFormat.set_clipboard( ini_read_string( "settings", "clipboard", "true" ) == "true" ? true : false );

ini_close();

loadingbar.visible	= false;

ERROR.add( function( _i ) {
	syslog( _i );
	
});
LOGGER.add( function( _text ) {
	syslog( _text[1] );
	
});
