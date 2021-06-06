#macro PROGRAM	global.__program
#macro ERROR	global.__error
#macro LOGGER	global.__logger

PROGRAM	= id;

ERROR	= new PublisherChannel()
LOGGER	= new PublisherChannel();

loadPath	= "";
savePath	= "";
wikiPath	= "";

clipboard	= false;

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

