var _ini	= ini_open( "pref.ini" );

ini_write_string( "paths", "load", loadPath );
ini_write_string( "paths", "save", savePath );

ini_close();
