function TOC() constructor {
	static add	= function( _wiki, _table, _data ) {
		if ( __Pages.key_exists( _wiki ) == false )
			__Pages.set( _wiki, {} );
		
		_wiki	= __Pages.lookup( _wiki );
		
		if ( variable_struct_exists( _wiki, _table ) == false )
			_wiki[$ _table ]	= new LinkedList().order( function( _v ) {
				var _m = __Search( _v, function( _a, _b ) {
					 return _a.name == _b.name ? 2 : _a.name > _b.name;
				});
				if ( error_type( _m ) == ValueNotFound ) { _m = _m.index; }
				
				return _v > index( _m ) ? _m + 1 : _m;
				
			});
		
		_wiki[$ _table ].push( _data );
		
	}
	static write	= function( _file_path ) {
		var _index_key	= __Pages.first();
		var _file, _trim;
		
		while ( error_type( _index_key ) != ValueNotFound ) {
			var _index		= __Pages.lookup( _index_key );
			var _categories	= variable_struct_get_names( _index );
			
			//var _header_key	= ds_map_find_first( _index );
			var _filename	= PROGRAM.savePath + _index_key + ".md";
			
			LOGGER.notify( [ "build", _index_key + " found." ] );
			
			//if ( file_exists( _filename ) == false ) {
			_trim	= string_replace( _index_key, "-Index", "" )
			_file	= new FileText( _filename, false, true );
			_file.write( "|Jump To|[`back`]("  + _trim + ")|" );
			_file.write( "|---|---|\n\n" );
			
			var _i = 0; repeat( array_length( _categories )) {
				var _header_key	= _categories[ _i++ ];
				var _header		= _index[$ _header_key ];
				//var _header	= _index[? _header_key ];
					
				_file.write( "### " + _header_key );
					
				LOGGER.notify([ "build", "    " + _header_key + " found..." ]);
					
				var _j = 0; repeat( _header.size() ) {
					var _meta	= _header.index( _j++ );
					
					_file.write( string_con( "* [", _meta.name, "](", _meta.path, ")" ) );
					LOGGER.notify([ "build", "        " + _meta.path + " found." ]);
					
				}
				
			}
			_file.close();
			
			_index_key	= __Pages.next();
			
		}
		
	}
	__Pages	= new Dictionary();
	
}
