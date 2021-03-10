var _px	= room_width div 2;
var _py	= ( h - string_height( display ) ) div 2;

draw_set_halign( fa_center );

if ( bg.update() ) {
	bg.set();
		draw_clear_alpha( c_white, 0.0 );
		
		draw_set_color( c_black );
		
		draw_rectangle( 1, 1, w - 2, h - 2, false );
		
		draw_set_color( c_white );
		
		draw_text( _px, _py, display );
	bg.reset();
	
}
bg.draw( x, y );

if ( fg.update() ) {
	fg.set();
		draw_clear( c_white );
		
		draw_set_color( c_black );
		
		draw_text( _px, _py, display );
	fg.reset();
	
}
fg.draw_part( 0, 0, w * perc, h, x, y );

draw_set_halign( fa_left );
