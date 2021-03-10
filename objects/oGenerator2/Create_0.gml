draw_set_font( font0 );

loadPath	= ""
savePath	= ""
wikiPath	= "";

parser		= new Parser();
files		= new DsQueue();
output		= new DsQueue();
macros		= new DsQueue();

functions		= 0;
constructors	= 0;
objects			= 0;

// @desc whether or not to output verbose messages during compilation
verbose		= true;
// @desc whether or not to overwrite files that already exist
overwrite	= true;
// @desc if true, the file(s) will be copied to the clipboard instead
clipboard	= false;

total		= 0;
final		= 0;
errors		= 0;

table		= undefined;

TOC = function() constructor {
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
error	= function() {
	var _string	= "ERROR in " + target.name + " ::\n";
	
	var _i = 0;repeat( argument_count ) {
		_string	+= string( argument[ _i++ ] );
		
	}
	++errors;
	
	console.add_message( "error", _string );
	syslog( _string );
	
}
trace	= function() {
	if ( verbose == false ) { return; }
	
	var _string	= "";
	
	var _i = 1;repeat( argument_count - 1 ) {
		_string	+= string( argument[ _i++ ] );
		
	}
	console.add_message( argument[ 0 ], _string );
	syslog( _string );
	
}
busy	= function() {
	return files.size() > 0;
	
}
