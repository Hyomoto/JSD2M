Message	= function( _text, _filters ) constructor {
	static has	= function( _filter ) {
		var _i = 0; repeat( array_length( _filter ) ) {
			if ( array_contains( filters, _filter[ _i++ ] ) > -1 ) { return true; }
			
		}
		return false;
		
	}
	text	= _text;
	filters	= string_explode( _filters, ",", true );
	
}
add_filter	= function( _filter ) {
	var _found	= filter.contains( _filter );
	
	if ( not _found ) {
		if ( filter.index( 0 ) == "all" ) {
			filter.pop( 0 );
			
		}
		filter.push( _filter );
		
		filter_messages();
		
	}
	
}
remove_filter	= function( _filter ) {
	var _found	= filter.contains( _filter );
	
	if ( _found ) {
		filter.remove( _found );
		
		if ( filter.size() == 0 ) {
			filter.push( "all" );
			
		}
		filter_messages();
		
	}
	
}
filter_messages	= function() {
	display.clear();
	
	var _i = 0; repeat( messages.size() ) {
		var _message	= messages.find_index( _i++ );
		
		if ( _message.has( filter.to_array() ) ) {
			display.add( _message );
			
		}
		
	}
	surface.redraw();
	
	offset	= 0;
	
}
add_message	= function( _filters, _text ) {
	var _message	= new Message( _text, "all," + _filters );
	
	messages.add( _message );
	
	if ( filter == undefined || _message.has( filter.to_array() ) ) {
		display.add( _message );
		surface.redraw();
		
	}
	
}
messages	= new DsList();
display		= new DsList();
filter		= new ArrayList().from_array( ["all"] );
interface	= new PointerSimpleMouse( new ShapeRectangle( bbox_left, bbox_top, bbox_right - bbox_left + 1, bbox_bottom - bbox_top + 1 ) );
surface		= new Surface( interface.shape.w, interface.shape.h );
offset		= 0;

interface.onLeave	= function() {
	statusbar.set_text();
	
}
