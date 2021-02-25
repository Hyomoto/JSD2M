// Inherit the parent event
event_inherited();

interface.onEnter	= function() {
	statusbar.set_text( "Enter the wiki path." );
	
}
interface.onUp	= function() {
	var _path	= get_string( "Enter the path to the wiki:", oGenerator.wikiPath );
	
	if ( _path == "" ) { return; }
	
	textbox_wiki.set_text( filename_path( _path ) );
	
}
