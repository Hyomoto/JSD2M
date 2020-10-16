/// @func Constructor
/// @param {string} header
/// @param {Header} header_package
/// @desc	Creates a new Constructor entry.
function Constructor( _header, _package ) constructor {
	static add_method	= function( _header, _package ) {
		return methods.add( new Method( _header, _package ) );
		
	}
	static add_variable	= function( _var ) {
		return variables.add( _var );
		
	}
	methods		= new DsLinkedList();
	variables	= new DsLinkedList();
	
	name	= _header[ 0 ];
	header	= _header[ 0 ];
	args	= _header[ 1 ];
	desc	= "No description."
	example	= "// no example";
	returns	= "N/A `undefined`"
	wikiIndex	= undefined;
	wikiCategory= "Default";
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
	/// @ignore
	header	+= "(";
	
	// build function header
	if ( array_length( args ) > 0 ) {
		header	+= " ";
		
		var _i = 0; repeat( array_length( args ) ) {
			if ( _i > 0 ) { header += ", "; }
			
			header	+= args[ _i ].name;
			++_i;
			
		}
		header	+= " ";
		
	}
	/// @ignore
	header	+= ")";
	
}
