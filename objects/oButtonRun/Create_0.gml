// Inherit the parent event
event_inherited();

interface	= new PointerSimpleMouse( new ShapeRectangle( bbox_left, bbox_top, bbox_right - bbox_left + 1, bbox_bottom - bbox_top + 1 ) );
interface.onEnter	= function() {
	statusbar.set_text( "Create Markdown" );
	
}
interface.onUp	= function() {
	if ( instance_exists( oGenerator ) ) { return; }
	
	if ( PROGRAM.clipboard == false && directory_exists( PROGRAM.savePath ) == false ) {
		console.add_message( "error","error: save path doesn't exist." );
		return;
		
	}
	if ( directory_exists( PROGRAM.loadPath ) == false ) {
		console.add_message( "error","error: load path doesn't exist." );
		return;
		
	}
	loadingbar.visible	= true;
	
	instance_create_layer( 0, 0, layer, oGenerator );
	
}
