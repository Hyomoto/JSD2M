/// @func Method
/// @param {string} header
/// @param {Header} header_package
/// @param {struct}	parent
/// @desc	Creates a new Method entry.
function Method( _header, _package, _parent ) constructor {
	pattern	= "";
	name	= _header[ 0 ];
	header	= _header[ 0 ];
	args	= _header[ 1 ];
	desc	= "No description."
	example	= "// no example";
	returns	= "N/A `undefined`"
	wikiIndex	= undefined;
	wikiCategory= "Default";
	// defaults
	if ( _parent != undefined ) {
		switch ( name ) {
			case "is" :
				args[ 0 ]	= new Argument( "{Constructor} type The Constructor to compare this against." );
				returns	= lookup_return( "bool" );
				desc	= "Returns `true` if the provided type is " + string( _parent.name ) + ".";
				break;
			case "toArray" :
				returns	= lookup_return( "array" );
				desc	= "Returns the structure as a array.";
				break;
			case "toString" :
				returns	= lookup_return( "string" );
				desc	= "Returns the structure as a string.";
				break;
		}
		
	}
	// read header package, if provided
	if ( _package != undefined ) {
		var _args	= _package.arguments.toArray();
		var _i = 0; repeat( max( array_length( args ), array_length( _args ) ) ) {
			if ( _i < array_length( _args ) ) {
				args[ _i ]	= _args[ _i ];
				
			} else {
				args[ _i ]	= new Argument( args[ _i ] );
				
			}
			++_i;
			
		}
		if ( _package.name != "" ) { name = _package.name; }
		desc	= _package.desc;
		example	= _package.example;
		returns	= _package.returns;
		wikiIndex	= _package.wikiIndex;
		wikiCategory= _package.wikiCategory;
		
	} else {
		var _i = 0; repeat( array_length( args ) ) {
			args[ _i ]	= new Argument( args[ _i ] );
			++_i;
		}
		
	}
	// build function header
	pattern	= name;
	header	+= "(";
	
	if ( array_length( args ) > 0 ) {
		pattern	+= "-";
		header	+= " ";
		
		var _i = 0; repeat( array_length( args ) ) {
			if ( _i > 0 ) { header += ", "; pattern += "-"; }
			
			pattern	+= ( is_struct( args[ _i ] ) ? args[ _i ].name : args[ _i ] );
			header	+= ( is_struct( args[ _i ] ) ? args[ _i ].name : args[ _i ] );
			++_i;
			
		}
		pattern	+= "-";
		header	+= " ";
		
	}
	header	+= ")";
	
}
