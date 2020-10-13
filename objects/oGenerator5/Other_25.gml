files	= new DsQueue();
table	= new TOC();

if ( clipboard == false ) {
	var _path	= loadPath;
	
	if ( _path != "" ) {
		var _list	= file_get_directory( _path + "scripts\\", "*.gml", true );
		
		repeat( _list.size() ) {
			var _file	= _list.dequeue();
			
			var _name	= filename_name( _file );
			var _struct	= string_upper( string_char_at( _name, 1, ) ) == string_char_at( _name, 1 );
			
			if ( string_pos( ".gml", _name ) > 0 && _struct ) {
				files.enqueue( new FileText( _file, true ) );
				
			}
			
		}
		
	}
	
} else {
	var _file	= get_open_filename_ext( "Scripts|*.gml", "", loadPath, "Open" );
	
	if ( _file != "" ) {
		files.enqueue( new FileText( _file, true ) );
		
	}
	
}
trace( "Found ", files.size(), " project files." );

total	= files.size();

if ( clipboard == false ) {
	path	= savePath;
	
}
