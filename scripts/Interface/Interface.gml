function Interface() {
	static pointer	= new PointerStack( 0, 0, room_width, room_height );
	static event	= new FrameEvent( FAST.STEP, 0, function() {
		Interface().update( mouse_x, mouse_y );
		
	});
	return pointer;
	
}
