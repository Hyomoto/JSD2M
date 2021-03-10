var _ini	= ini_open( "pref.ini" );

ini_write_string( "paths", "load", loadPath );
ini_write_string( "paths", "save", savePath );
ini_write_string( "paths", "wiki", wikiPath );
ini_write_string( "settings", "clipboard", clipboard == true ? "true" : "false" );

ini_close();
