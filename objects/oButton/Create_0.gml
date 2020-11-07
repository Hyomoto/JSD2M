interface	= new PointerSimpleMouse( new ShapeRectangle( bbox_left, bbox_top, bbox_right - bbox_left + 1, bbox_bottom - bbox_top + 1 ) );

interface.onLeave	= function() {
	statusbar.set_text();
	
}
