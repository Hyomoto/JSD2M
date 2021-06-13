// Inherit the parent event
event_inherited();

interface.onEnter	= function() {
	statusbar.set_text( "Choose the location to save to..." );
	
}
interface.onUp	= function() {
	var _file	= get_open_filename( "All types|*.*", "" );
	
	if ( _file == "" ) { return; }
	
	textbox_save.set_text( filename_path( _file ) );
	
	PROGRAM.save();
	
}
enable	= true;
