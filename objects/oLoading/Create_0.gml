update	= function( _display, _percent ) {
	display	= _display;
	perc	= _percent;
	
	bg.redraw();
	fg.redraw();
	
}
reset	= function() {
	display	= "0/0"
	perc	= 0.0;
	
}
x		= x;
y		= y;
w		= bbox_right - bbox_left + 1;
h		= bbox_bottom - bbox_top + 1;

bg	= new Surface( w, h );
fg	= new Surface( w, h );

display	= "0/0"
perc	= 0.0;
