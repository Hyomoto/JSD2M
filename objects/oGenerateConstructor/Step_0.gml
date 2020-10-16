if ( busy() ) {
	var _timer	= new Timer();
	
	repeat( files.size() ) {
		target	= files.dequeue();
		
		trace( "Processing ", target.name, "..." );
		
		event_user( 0 );
		
		target.discard();
		
		if ( _timer.elapsed() > 100000 ) { break; }
		
	}
	if ( files.size() == 0 ) {
		if ( clipboard == false ) { event_user( 3 ); }
		
		trace( "Found ", total, ", saved ", final, " with ", errors, " errors.  Check ouput for details." );
		
		table.destroy();
		
		loadingbar.visible	= false;
		
	}
	complete	= total - files.size();
	display		= string( complete ) + "/" + string( total );
	perc		= complete / total;
	
	loadingbar.update( display, perc );
	
	bg.redraw	= true;
	fg.redraw	= true;
	
}
