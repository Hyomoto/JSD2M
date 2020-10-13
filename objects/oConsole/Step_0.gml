if ( interface.update() ) {
	if ( mouse_wheel_up() ) { offset += 1; surface.redraw = true; }
	else if ( mouse_wheel_down() && offset > 0 ) { offset -= 1; surface.redraw = true; }
	
}
