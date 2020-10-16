// Inherit the parent event
event_inherited();

interface.onEnter	= function() {
	statusbar.set_text( "Create Markdown" );
	
}
interface.onUp	= function() {
	if ( Generator.busy() ) { return; }
	
	if ( Generator.clipboard == false && directory_exists( Generator.savePath ) == false ) {
		console.add_message( "error","error: save path doesn't exist." );
		return;
		
	}
	if ( directory_exists( Generator.loadPath ) == false ) {
		console.add_message( "error","error: load path doesn't exist." );
		return;
		
	}
	loadingbar.visible	= true;
	
	with ( Generator ) { event_user( 15 ); }
	
}
