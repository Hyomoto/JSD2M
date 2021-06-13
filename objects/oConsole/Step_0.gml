if ( interface.update( mouse_x, mouse_y ) ) {
	if ( mouse_wheel_up() ) { offset += 1; surface.redraw(); }
	else if ( mouse_wheel_down() && offset > 0 ) { offset -= 1; surface.redraw(); }
	
}
