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
	
	if ( _found == -1 ) {
		if ( filter.get( 0 ) == "all" ) {
			filter.remove( 0 );
			
		}
		filter.add( _filter );
		
		filter_messages();
		
	}
	
}
remove_filter	= function( _filter ) {
	var _found	= filter.contains( _filter );
	
	if ( _found > -1 ) {
		filter.remove( _found );
		
		if ( filter.size() == 0 ) {
			filter.add( "all" );
			
		}
		filter_messages();
		
	}
	
}
filter_messages	= function() {
	display.clear();
	
	var _i = 0; repeat( messages.size() ) {
		var _message	= messages.find_index( _i++ );
		
		if ( _message.has( filter.toArray() ) ) {
			display.add( _message );
			
		}
		
	}
	surface.redraw	= true;
	
	offset	= 0;
	
}
add_message	= function( _filters, _text ) {
	var _message	= new Message( _text, "all," + _filters );
	
	messages.add( _message );
	
	if ( filter == undefined || _message.has( filter.toArray() ) ) {
		display.add( _message );
		surface.redraw	= true;
		
	}
	
}
messages	= new DsList();
display		= new DsList();
filter		= new ArrayList(["all"]);
interface	= new Interface( new ShapeRectangle( bbox_left, bbox_top, bbox_right - bbox_left + 1, bbox_bottom - bbox_top + 1 ) );
surface		= new Surface( interface.shape.w, interface.shape.h );
offset		= 0;
state		= STATE_UP;

interface.onLeave	= function() {
	statusbar.set_text();
	
}
