set_text	= function( _text ) {
	if ( _text == undefined ) {
		return;
		
	} else {
		var _w	= interface.shape.w;
		
		text	= _text;
		
		variable_instance_set( Generator, file, _text );
		
		if ( string_width( text ) + 8 > _w ) {
			var _next	= "";
			var _last	= string_length( text );
			
			conc	= "...";
			
			do {
				_next	= string_char_at( text, _last-- ) + _next;
				
			} until ( string_width( conc + _next ) + 8 > _w );
			
			conc	+= string_delete( _next, 1, 1 );
			
		} else {
			conc	= text;
			
		}
		
	}
	
}
interface	= new PointerSimpleMouse( new ShapeRectangle( bbox_left, bbox_top, bbox_right - bbox_left + 1, bbox_bottom - bbox_top + 1 ) );

text	= "";
conc	= "";
enable	= true;

interface.onEnter	= function() {
	statusbar.set_text( text );
	
}
interface.onLeave	= function() {
	statusbar.set_text();
	
}
