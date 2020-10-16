if ( busy() ) {
	var _timer	= new Timer();
	
	repeat( files.size() ) {
		target	= files.dequeue();
		
		trace( "build", "Processing ", target.name, "..." );
		
		event_user( 0 );
		
		event_user( 5 );
		
		target.discard();
		
		if ( _timer.elapsed() > 100000 ) { break; }
		
	}
	if ( files.size() == 0 ) {
		if ( clipboard == false ) { event_user( 10 ); }
		
		trace( "build", "Read ", total, " files containing ", constructors, " constructors, and ", functions, " functions." );
		
		table.destroy();
		
		loadingbar.visible	= false;
		
	}
	complete	= total - files.size();
	
	loadingbar.update( string( complete ) + "/" + string( total ), complete / total );
	
}
