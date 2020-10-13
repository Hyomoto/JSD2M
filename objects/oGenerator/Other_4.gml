var _ini	= ini_open( "pref.ini" );

textbox_load.set_text( ini_read_string( "paths", "load", working_directory ) );
textbox_save.set_text( ini_read_string( "paths", "save", working_directory ) );

ini_close();

loadingbar.visible	= false;

window_set_caption( "JSDocToMarkdown" );
