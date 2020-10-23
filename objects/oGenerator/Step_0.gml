if ( busy() ) {
	var _timer	= new Timer();
	
	repeat( files.size() ) {
		var _next	= files.dequeue();
		
		target	= _next.file;
		
		trace( "build", "Processing ", target.name, "..." );
		
		event_user( _next.event );
		
		event_user( 5 );
		
		target.discard();
		
		if ( _timer.elapsed() > 100000 ) { break; }
		
	}
	if ( files.size() == 0 ) {
		if ( clipboard == false ) { event_user( 10 ); }
		
		trace( "build", "Read ", total, " files containing ", objects, " objects, ", constructors, " constructors, and ", functions, " functions." );
		
		table.destroy();
		
		loadingbar.visible	= false;
		
	}
	complete	= total - files.size();
	
	loadingbar.update( string( complete ) + "/" + string( total ), complete / total );
	
}
