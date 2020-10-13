state		= STATE_UP;
interface	= new Interface( new ShapeRectangle( bbox_left, bbox_top, bbox_right - bbox_left + 1, bbox_bottom - bbox_top + 1 ) );

interface.onLeave	= function() {
	statusbar.set_text();
	
}

#macro STATE_UP		0
#macro STATE_HOVER	1
#macro STATE_DOWN	2
