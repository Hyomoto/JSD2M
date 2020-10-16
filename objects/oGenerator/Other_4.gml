var _ini	= ini_open( "pref.ini" );

textbox_load.set_text( ini_read_string( "paths", "load", working_directory ) );
textbox_save.set_text( ini_read_string( "paths", "save", working_directory ) );
textbox_wiki.set_text( ini_read_string( "paths", "wiki", "" ) );

oButtonSaveFormat.set_clipboard( ini_read_string( "settings", "clipboard", "true" ) == "true" ? true : false );

ini_close();

loadingbar.visible	= false;

window_set_caption( "JSDocToMarkdown" );
