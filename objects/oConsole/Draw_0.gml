if ( surface.update() ) {
	var _line	= string_height( "A" );
	var _y		= interface.shape.h - _line;
	var _x		= 4;
	
	surface.set()
		draw_clear( c_dkgray );
		draw_set_color( c_ltgray );
		
		var _i = display.size() - offset; while ( _y > 0 && _i > 0 ) {
			draw_text( _x + 4, _y, string( _i ) );
			draw_text( _x + 32, _y, display.find_index( --_i ).text );
			
			_y	-= _line;
			
		}
		
	surface.reset();
	
}
surface.draw( x, y );
