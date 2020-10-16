/// @func Variable
/// @param {string} header
/// @param {Header} header_package
/// @desc	Creates a new Variable entry.
function Variable( _header, _package ) constructor {
	name	= _header;
	type	= "undef";
	desc	= "No description."
	// read header package, if provided
	if ( _package != undefined ) {
		var _args	= _package.arguments.toArray();
		var _i = 0; repeat( array_length( _args ) ) {
			args[ _i ]	= _args[ _i ];
			++_i;
			
		}
		name	= _package.name;
		desc	= _package.desc;
		example	= _package.example;
		returns	= _package.returns;
		
	}
	// build function header
	pattern	= "name-";
	
	if ( array_length( args ) > 0 ) {
		name	+= "( ";
		
		var _i = 0; repeat( array_length( args ) ) {
			if ( _i > 0 ) { name += ", "; pattern += "-"; }
			
			pattern	+= ( is_struct( args[ _i ] ) ? args[ _i ].name : args[ _i ] );
			name	+= ( is_struct( args[ _i ] ) ? args[ _i ].name : args[ _i ] );
			++_i;
			
		}
		pattern	+= "-";
		name	+= " )";
		
	}
	
}
