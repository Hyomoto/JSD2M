function Method( _name, _arguments ) constructor {
	static toString	= function() {
		var _string	= name + "( ";
		
		var _i = 0; repeat( array_length( arguments ) ) {
			if ( _i > 0 ) { _string += ", "; }
			_string	+= arguments[ _i++ ].name;
			
		}
		return _string + " )";
		
	}
	static toLink	= function() {
		static __illegal	= ["*", "<", ">" ];
		link	= string_lower( name ) + "-";
		
		var _i = 0; repeat( array_length( arguments ) ) {
			link	+= arguments[ _i++ ].name + "-";
			
		}
		var _i = 0; repeat( array_length( __illegal ) ) {
			var _scrub	= __illegal[ _i++ ];
			
			link	= string_replace_all( link, _scrub, "" );
			
		}
		while ( string_pos( "--", link ) > 0 ) {
			link	= string_replace_all( link, "--", "-" );
			
		}
		
	}
	var _args	= ( _arguments == "" ? [] : string_explode( _arguments, ",", true ) );
	
	var _i = 0; repeat( array_length( _args ) ) { _args[ _i ] = new Argument( _args[ _i ] ); ++_i; }
	
	name		= _name;
	arguments	= _args;
	description	= "No description.";
	link		= "";
	
}
