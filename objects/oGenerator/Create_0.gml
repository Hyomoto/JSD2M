loadingbar.visible	= true;
loadingbar.reset();

processed		= 0;
timeFrame		= new Timer();
timeTotal		= new Timer( "$S seconds", 2 );
stack			= undefined;
total			= 0;
actual			= 0;

//read_from_file( _file, _stack, false );

//syslog( _stack.top() );

//write_to_file( new FileText( "function_format.txt", true, false ), "test.txt", _stack.top() );
//trace	= function() {
//	if ( verbose == false ) { return; }
	
//	var _string	= "";
	
//	var _i = 1;repeat( argument_count - 1 ) {
//		_string	+= string( argument[ _i++ ] );
		
//	}
//	console.add_message( argument[ 0 ], _string );
//	syslog( _string );
	
//}
//verbose		= true;

//files	= new DsQueue();
//table	= new TOC();

//if ( clipboard == false ) {
//	var _path	= loadPath;
	
//	if ( _path != "" ) {
//		var _list	= file_get_directory( _path + "scripts\\", "*.gml", true );
		
//		repeat( _list.size() ) {
//			var _file	= _list.dequeue();
			
//			var _name	= filename_name( _file );
			
//			if ( string_pos( ".gml", _name ) > 0 ) {
//				files.enqueue( { file : new FileText( _file, true ), event : 0 } );
				
//			}
			
//		}
//		var _list	= file_get_directory( _path + "objects\\", "*.gml", true );
		
//		repeat( _list.size() ) {
//			var _file	= _list.dequeue();
			
//			var _name	= filename_name( _file );
			
//			if ( string_pos( "Create_0.gml", _name ) > 0 ) {
//				files.enqueue( { file : new FileText( _file, true ), event : 1 } );
				
//			}
			
//		}
		
//	}
	
//} else {
//	var _file	= get_open_filename_ext( "Scripts|*.gml", "", loadPath, "Open" );
	
//	if ( _file != "" ) {
//		files.enqueue( new FileText( _file, true ) );
		
//	}
	
//}
//trace( "build", "Found ", files.size(), " project files." );

//total	= files.size();

//if ( clipboard == false ) {
//	path	= savePath;
	
//}
