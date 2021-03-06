// Inherit the parent event
event_inherited();

interface	= new PointerSimpleMouse( new ShapeRectangle( bbox_left, bbox_top, bbox_right - bbox_left + 1, bbox_bottom - bbox_top + 1 ) );
interface.onEnter	= function() {
	statusbar.set_text( "Create Markdown" );
	
}
interface.onUp	= function() {
	if ( instance_exists( oGenerator ) ) { return; }
	
	if ( PROGRAM.clipboard == false && directory_exists( PROGRAM.savePath ) == false ) {
		console.add_message( "error","error: save path doesn't exist." );
		return;
		
	}
	if ( directory_exists( PROGRAM.loadPath ) == false ) {
		console.add_message( "error","error: load path doesn't exist." );
		return;
		
	}
	if ( PROGRAM.clipboard ) {
		var _file	= get_open_filename_ext( "Scripts|*.gml", "", PROGRAM.loadPath, "Open" );
		var _name, _template	= "";
		
		if ( _file == "" ) {
			ERROR.notify( "ERROR! File not found!" );
			return;
			
		}
		_file	= new FileText( _file, true, false );
		
		LOGGER.notify( ["build", "Processing " + _file.name + "..."] );
		
		var _stack	= GENERATOR.read_file( _file, string_pos( "\\objects\\", _file.name ) > 0 );
		
		switch ( _stack.top().type ) {
			case "object" : _template = "object"; break;			
			case "function" : _template = "function"; break;
			case "constructor" : _template = "constructor"; break;
		}
		if ( PROGRAM.templates[? _template ] == undefined ) {
			ERROR.notify( "ERROR! No template found for " + _name + " of type " + _stack.top().type + "! Aborted." );
			_file.discard();
			return;
			
		}
		var _output	= write_to_file( PROGRAM.templates[? _template ], new FileText( "", false, true ), _stack.top(), _stack.top().name );
		var _string	= "";
		
		_output.reset();
		
		repeat( _output.size() ) {
			_string	+= _output.read() + "\n";
			
		}
		_output.discard();
		_file.discard();
		
		clipboard_set_text( _string );
		
		LOGGER.notify( [ "build", "Output written as " + _template + " to clipboard." ] );
		
	} else {
		if ( PROGRAM.loadPath == "" ) {
			ERROR.notify( "ERROR! Must select a project folder first." );
			return;
			
		}
		var _path	= PROGRAM.loadPath;
		var _files	= new DsStack();
		
		if ( PROGRAM.constructors || PROGRAM.functions ) {
			var _list	= file_get_directory( _path + "scripts\\", "*.gml", true );
			
			repeat( _list.size() ) {
				var _file	= _list.dequeue();
				
				var _name	= filename_name( _file );
				
				if ( string_pos( ".gml", _name ) > 0 ) {
					_files.push( { file: _file, type : 0, name: string_replace( filename_name( _name ), ".gml", "" ) } );
					
				}
				
			}
			
		}
		if ( PROGRAM.objects ) {
			var _list	= file_get_directory( _path + "objects\\", "*.gml", true );
			
			repeat( _list.size() ) {
				var _file	= _list.dequeue();
				
				var _name	= filename_name( _file );
				
				if ( string_pos( "Create_0.gml", _name ) > 0 ) {
					var _path	= filename_path( _file );
					
					_name	= string_delete( _path, 1, string_last_pos( "\\", _path ));
					_name	= string_copy( _name, 1, string_length( _name ) - 1 );
					
					_files.push( { file : _file, type : 1, name: _name } );
					
				}
				
			}
			
		}
		LOGGER.notify( ["build", string_con( _files.size(), " files discovered." ) ] );
		
		with ( instance_create_layer( 0, 0, layer, oGenerator ) ) {
			stack	= _files;
			total	= stack.size();
			
		}
		
	}
	
}
