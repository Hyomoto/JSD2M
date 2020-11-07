if ( sprite_index != -1 ) {
	draw_sprite( sprite_index, ( enable ? 2 : interface.state ), x, y );
	draw_sprite_ext( gfx_icons_filter, icon, x, y, 1, 1, 0, ( enable ? c_white : c_black ), 1.0 );
	
}
