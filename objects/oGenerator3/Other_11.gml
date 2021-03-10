/// @desc Process Object
var _closure	= 0;			// the depth of the current read, 0 is root, 1 is function internal
var _header		= undefined;	// stores the last header read
var _ignore		= false;		// for functions, ignores the body and only reads the header
//var _open		= false;		// for constructors, whether the header has been read yet
var _method		= false;		// for methods, whether or not a method has been opened yet

var _open	= 0;

while ( target.eof() == false ) {
	var _read		= string_trim( target.peek( target.next ) );
	var _comment	= string_pos( "//", _read );
	var _change		= string_count( "{", _read ) - string_count( "}", _read );
	
	if ( _change + _closure != _closure ) {
		_closure	+= _change;
		
		if ( _change < 0 ) {
			//if ( _closure == 0 ) { _ignore = false; }
			if ( _closure == 0 ) { _method = false; }
			
		}
		
	}
	// ignore anything above 0 and 1
	if ( _method || _ignore ) {
		target.read();
		
		continue;
		
	}
	
	if ( _comment ) {
		var _tag		= string_find_tag( _read );
		
		if ( _tag != undefined ) {
			if ( _tag[ 0 ] == "@override" && _closure > 0 ) || ( _tag[ 0 ] == "@ignore" ) {
				target.read();
				
				_read	= target.read();
				
				_closure	+= string_count( "{", _read ) - string_count( "}", _read );
				
				if ( _closure > 1 ) { _method = true; }
				
			} else {
				_header	= new Header( target, parser );
				
				if ( _header.alias && _closure == 1 ) {
					
					
				}
				
			}
			continue;
			
		}
		var _ext	= 0;
		
		while ( _comment != 0 && _comment > _ext ) {
			_ext = string_next_quote( _read, _ext );
			// the quote happens after the comment, or there is not quote
			if ( _ext == 0 || _ext > _comment ) {
				_read = strc( _read, 1, _comment - 1 );
				
				break;
				
			}
			// the comment happens after the quote, check for encapsulation
			_ext = string_next_quote( _read, _ext );
			// comment is encapsulated, repeat until no //'s are found
			if ( _ext > _comment ) {
				_comment	= string_pos_ext( "//", _read, _ext );
				
			}
			
		}
		
	}
	if ( string_pos( "#macro", _read ) > 0 ) {
		macros.enqueue( new Macro( strd( _read, 1, string_pos( "#macro", _read ) + 5 ), _header ) );
		_header	= undefined;
		trace(  "build,macro", "Found macro: ", macros.tail().name );
		
	} else {
		switch ( _open ) {
			// root, check for functions
			case false :
				_open	= new Object( target.name, _header );
				
				//if ( array_length( _break ) > 1 ) {
				//	_open.implements	= "(#" + strc( _break[ 1 ], 1, string_pos( "(", _break[ 1 ] ) - 1 ) + ")";
					
				//}
				_header	= undefined;
				trace(  "build,object", "Found object: ", _open.name );
				output.enqueue( _open );
				++objects;
				
				break;
			
			default :
				var _static	= false;
			
				if ( string_pos( "var", _read ) == 1 || string_pos( "if", _read ) == 1 ) { break; }
				if ( string_pos( "=", _read ) == 0 ) { break; }
				if ( string_pos( "static", _read ) == 1 ) { _read = strd( _read, 1, 6 ); _static = true; }
			
				var _break	= string_explode( _read, "=", true );
				// method
				if ( string_pos( "function", _break[ 1 ] ) == 1 ) {
					var _name	= string_to_func( _break[ 1 ] );
				
					_name[ 0 ]	= _break[ 0 ];
					var _d = _open.add_method( _name, _header, _open );
					_method	= true;
					_header	= undefined;
				
				// variable
				} else {
					var _variable;
				
					if ( _header == undefined || _header.arguments.size() == 0 ) {
						_variable	= new Argument( _break[ 0 ] );
					
						if( _header != undefined ) { _variable.desc = _header.desc; }
					
					} else {
						_variable	= _header.arguments.toArray()[0];
					
					}
					_variable.name	= _break[ 0 ];
				
					var _d	= _open.add_variable( _variable );
					_header	= undefined;
				
				}
				break;
		
		}
		
	}
	if ( _closure > 1 ) {
		_method = true;
		
	}
	target.read();
	
}
