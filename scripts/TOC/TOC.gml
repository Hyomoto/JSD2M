function TOC() constructor {
	static add	= function( _wiki, _table, _data ) {
		if ( pages[? _wiki ] == undefined ) {
			ds_map_add_map( pages, _wiki, ds_map_create() );
			
		}
		_wiki	= pages[? _wiki ];
		
		if ( _wiki[? _table ] == undefined ) {
			ds_map_add_list( _wiki, _table, ds_list_create() );
			
		}
		_table	= _wiki[? _table ];
		
		ds_list_add( _table, _data );
		
	}
	static destroy	= function() {
		ds_map_destroy( pages );
		
	}
	pages	= ds_map_create();
	
}
