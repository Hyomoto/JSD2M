#macro PROGRAM	global.__program
#macro ERROR	global.__error
#macro LOGGER	global.__logger

PROGRAM	= id;

save	= function() {
	var _ini	= ini_open( "pref.ini" );
	
	ini_write_string( "paths", "load", loadPath );
	ini_write_string( "paths", "save", savePath );
	ini_write_string( "paths", "wiki", wikiPath );
	ini_write_string( "settings", "clipboard", clipboard == true ? "true" : "false" );
	ini_write_string( "settings", "objects", objects == true ? "true" : "false" );
	ini_write_string( "settings", "constructors", constructors == true ? "true" : "false" );
	ini_write_string( "settings", "functions", functions == true ? "true" : "false" );
	
	ini_close();
	
}
ERROR	= new PublisherChannel()
LOGGER	= new PublisherChannel();

loadPath	= "";
savePath	= "";
wikiPath	= "";

clipboard	= false;
objects		= true;
constructors= true;
functions	= true;

window_set_caption( "JSDocToMarkdown" );

draw_set_font( font0 );

var _templates = file_get_directory( "", "*.txt", true ).foreach( function ( _i ) {
	return new FileText( _i, true, false );
	
});
templates	= ds_map_create();

repeat( _templates.size() ) {
	ds_map_add( templates, string_replace( _templates.head().name, ".txt", "" ), _templates.head() );
	_templates.dequeue();
	
}

