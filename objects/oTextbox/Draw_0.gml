if ( sprite_index != -1 ) {
	draw_sprite_ext( sprite_index, ( enable ? interface.state : 3 ), x, y, image_xscale, image_yscale, 0, c_white, 1.0 );
	
}
draw_set_color( c_dkgray );

draw_text( offsetX, offsetY, conc );
