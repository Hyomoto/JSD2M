#macro GENERATOR	global.__generator

RenderManager().set_scale( 0.7 );

#macro APP_NAME		"JSDocToMarkdown"
#macro APP_VERSION	"v1.5"
#macro APP_DATE		"3/17/2021"

#macro IGNORE	global.__ignore_state
IGNORE	= {}

GENERATOR	= new Generator();

GENERATOR.add_jsdoc( "ignore", function( _parser ) {
	return IGNORE;
	
});
GENERATOR.add_jsdoc( "func", function( _parser ) {
	return [ "func", string_trim( _parser.remaining() ) ];
	
});
GENERATOR.add_jsdoc( "var", function( _parser ) {
	return [ "variable", new Variable( string_trim( _parser.remaining() )) ];
	
});
GENERATOR.add_jsdoc( "param", function( _parser ) {
	return [ "arguments", new Argument( string_trim( _parser.remaining() )) ];
	
});
GENERATOR.add_jsdoc( "desc", function( _parser ) {
	static __parser__	= new Parser();
	
	var _string	= string_trim( _parser.remaining() );
	
	_parser.next_line()
	
	__parser__.parse( _parser.remaining() );
	
	while ( not _parser.eof() )  {
		if ( string_copy( __parser__.next(), 1, 2 ) != "//" || __parser__.has_next() == false ) { break; }
		if ( string_pos( "@", __parser__.peek() ) > 0 ) { break; }
		_string	+= " " + strd( __parser__.remaining(), 1, 2 );
		
		_parser.next_line()
		__parser__.parse( _parser.toString() );
		
	}
	//_parser.next_line();
	
	//while ( not _parser.eof() && strc( _parser.peek(), 1, 2 ) == "//" && strc( _parser.peek(), 1, 3 ) != "///" )  {
	//	_string	+= " " + strd( _parser.toString(), 1, 2 );
		
	//	_parser.next_line();
		
	//}
	return [ "description", _string ];
	
});
GENERATOR.add_jsdoc( "example", function( _parser ) {
	var _string	= "";
	
	_parser.next_line();
	
	while ( not _parser.eof() && strc( _parser.peek(), 1, 2 ) == "//" && strc( _parser.peek(), 1, 3 ) != "///" )  {
		_string	+= string_delete( _parser.toString(), 1, 2 ) + "\n";
		
		_parser.next_line();
		
	}
	return [ "example", _string ];
	
});
GENERATOR.add_jsdoc( "output", function( _parser ) {
	return [ "output", string_trim( _parser.remaining() ) ];
	
});
GENERATOR.add_jsdoc( "returns", function( _parser ) {
	static __parser__	= new Parser(" \t,");
	static __safety__	= new Array(["int","real","string","float","bool","array","mixed","self","other"]);
	
	__parser__.parse( _parser.remaining() );
	
	var _string	= "";
	
	while( __parser__.has_next() ) {
		if ( __parser__.peek() == "or" ) { _string += " or "; __parser__.next(); }
		else if ( _string != "" ) { _string += ", " }
		
		if ( __safety__.contains( string_lower( __parser__.peek() )) > -1 ) {
			_string	+= "`" + string_lower( __parser__.next() ) + "`"
			
		} else {
			_string	+= "[" + __parser__.peek() + "](" + __parser__.next() + ")";
			
		}
		
	}
	return [ "returns", _string ];
	
});
GENERATOR.add_jsdoc( "throws", function( _parser ) {
	static __parser__	= new Parser(" \t,");
	
	__parser__.parse( _parser.remaining() );
	
	var _string	= "";
	
	while( __parser__.has_next() ) {
		if ( __parser__.peek() == "or" ) { continue; }
		if ( _string != "" ) { _string += ", " }
		
		_string	+= "[" + __parser__.peek() + "](" + __parser__.next() + ")";
		
	}
	return [ "throws", _string ];
	
});
GENERATOR.add_jsdoc( "wiki", function( _parser ) {
	var _wiki	= { index: "", category: "Default" }
	
	_wiki[$ "index" ] = _parser.next();
	
	if ( _parser.has_next() ) {
		_wiki[$ "category" ] = string_trim( _parser.remaining() );
		
	}
	return [ "wiki", _wiki ];
	
});

					//default :
					//	__parser.reset();
					//	break;
					//	safe_throw( JSDocNotFoundException, [ _target.name, __parser.next(), _target.next ] );
					
					//	break;
						
//				}
