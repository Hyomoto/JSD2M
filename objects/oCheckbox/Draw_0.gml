if ( sprite_index != -1 ) {
	draw_set_halign( fa_right );
	
	draw_sprite( sprite_index, variable_instance_get( PROGRAM, value ), x, y );
	
	draw_text( x - 4, y, name );
	
	draw_set_halign( fa_left );
	
}
