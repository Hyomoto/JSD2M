// Inherit the parent event
event_inherited();

interface.onEnter	= function() {
	statusbar.set_text( "Choose the project to read from..." );
	
}
interface.onUp	= function() {
	var _file	= get_open_filename( "GMS2 Project File(*.yyp)|*.yyp", "" );
	
	if ( _file == "" ) { return; }
	
	textbox_load.set_text( filename_path( _file ) );
	
	PROGRAM.save();
	
}
