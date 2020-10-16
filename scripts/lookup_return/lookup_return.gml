function lookup_return( _string ) {
	static __table	= function( _string ) {
		switch ( _string ) {
			case "null" : return "`undefined`";
			case "intp" : return "int (`0..`)";
			case "intn" : return "int (`..0`)";
			case "int"  : return "int (`..0..`)";
			case "real" : return "real (`0.00`)";
			case "float": return "float (`0.00`)";
			case "string" : return "string (`\"string\"`)";
			case "array": return "array (`[values...]`)";
			case "list" : return "list (`[|values...]`)";
			case "map"  : return "map (`[?values...]`)";
			case "self" : return "`self`";
			case "boolean" :
			case "bool" : return "boolean (`true` or `false`)";
			
		}
		return _string;
		
	}
	var _strings	= string_explode( _string, "||", true );
	var _result		= "";
	
	for ( var _i = 0; _i < array_length( _strings ); ++_i ) {
		if ( string_pos( " ", _strings[ _i ] ) > 0 ) {
			var _pos	= string_pos( " ", _strings[ _i ] );
			
			_result += string_copy( _strings[ _i ], 1, _pos - 1 ) + " (" + string_delete( _strings[ _i ], 1, _pos ) + ")";
			
		} else {
			if ( _i > 0 && _i < array_length( _strings ) - 1 ) { _result += ", " }
			else if ( _i > 0 && _i == array_length( _strings ) - 1 ) { _result += ", or " }
			
			_result += __table( _strings[ _i ] );
			
		}
		
	}
	return _result;
	
}