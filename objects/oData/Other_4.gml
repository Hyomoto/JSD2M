var _ini	= ini_open( "pref.ini" );

loadPath	= ini_read_string( "paths", "load", working_directory );
savePath	= ini_read_string( "paths", "save", working_directory );
wikiPath	= ini_read_string( "paths", "wiki", "" )

textbox_load.set_text( loadPath );
textbox_save.set_text( savePath );
textbox_wiki.set_text( wikiPath );

oButtonSaveFormat.set_clipboard( ini_read_string( "settings", "clipboard", "true" ) == "true" ? true : false );

ini_close();

loadingbar.visible	= false;
