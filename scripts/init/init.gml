#macro GENERATOR	global.__generator

RenderManager().set_scale( 0.7 );

#macro APP_NAME		"JSDocToMarkdown"
#macro APP_VERSION	"v1.5"
#macro APP_DATE		"3/17/2021"

GENERATOR	= new Generator();

GENERATOR.add_jsdoc( "ignore", function( _parser ) { return undefined; });
GENERATOR.add_jsdoc( "func", function( _parser ) {
	return [ "func", string_trim( _parser.remaining() ) ];
	
});
GENERATOR.add_jsdoc( "param", function( _parser ) {
	return [ "arguments", new Argument( string_trim( _parser.remaining() ) ) ];
	
});
GENERATOR.add_jsdoc( "desc", function( _parser ) {
	var _string	= string_trim( _parser.remaining() );
	
	_parser.next_line();
	
	while ( not _parser.eof() && strc( _parser.peek(), 1, 2 ) == "//" && strc( _parser.peek(), 1, 3 ) != "///" )  {
		_string	+= " " + strd( _parser.toString(), 1, 2 );
		
		_parser.next_line();
		
	}
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
	return [ "return", string_trim( _parser.remaining() ) ];
	
});
GENERATOR.add_jsdoc( "wiki", function( _parser ) {
	var _wiki	= { index: "Default", category: undefined }
	
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