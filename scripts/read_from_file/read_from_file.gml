/// @func read_from_file
function read_from_file( _target, _object ) {
	var _stack	= new DsStack();
	
	static __illegal	= new Array(["if", "else", "repeat", "while", "do", "until", "for", "switch", "break", "continue", "exit", "with", "return", "var" ]);
	static __parser		= new Parser(" \t(");
	
	if ( not _target.exists() ) {
		throw FileNotFoundException;
		
	}
	static __strc	= function( _string, _x, _y ) { return string_trim( string_copy( _string, _x, _y ) ); }
	static __strd	= function( _string, _x, _y ) { return string_trim( string_delete( _string, _x, _y ) ); }
	static __lump	= function() { return { arguments: [] } };
	static __file	= function() { return {
		type: "object",
		header: {
			toString: function() {
				var _string	= name + "( ";
				
				var _i = 0; repeat( array_length( arguments ) ) {
					if ( _i > 0 ) { _string += ", "; }
					_string	+= arguments[ _i++ ].name;
					
				}
				return _string + " )";
				
			},
			name:"",
			arguments:[],
		},
		description: "No description.",
		implements: undefined,
		example: undefined,
		output: undefined,
		throws: undefined,
		wiki:{
			category: "Default",
			index: undefined
		},
		methods: [],
		variables: [],
		returns: "N/A `undefined`",
	}};
	
	var _lump	= __lump();
	var _file	= __file();
	var _layer	= _object;
	
	if ( _layer == 1 ) { _stack.push( _file ); }
	
	var _read; while ( not _target.eof() ) {
		_read	= string_trim( _target.read() );
		
		if ( string_copy( _read, 1, 3 ) == "///" ) {
			__parser.parse( __strd( _read, 1, 3 ) );
			
			switch ( __parser.next() ) {
				case "@ignore"	: _target.read(); break;
				case "@func"	: _lump[$ "func" ]	= string_trim( __parser.remaining() ); break;
				case "@param"	: array_push( _lump.arguments, new Argument( string_trim( __parser.remaining() ) ) ); break;
				case "@desc"	:
					var _string	= string_trim( __parser.remaining() );
					var _parser	= new Parser().parse( _target.peek() );
					
					while ( true )  {
						if ( string_copy( _parser.next(), 1, 2 ) != "//" || string_pos( "@", _parser.next() ) > 0 ) { break; }
						_string	+= " " + __strd( _target.read(), 1, 2 );
						_parser.parse( _target.peek() );
						
					}
					_lump[$ "description" ]	= _string;
					
					break;
					
				case "@example" :
					var _string	= "";
					
					while ( not _target.eof() && __strc( _target.peek(), 1, 2 ) == "//" && __strc( _target.peek(), 1, 3 ) != "///" )  {
						_string	+= string_delete( _target.read(), 1, 2 ) + "\n";
						
					}
					_lump[$ "example" ]	= _string;
					
					break;
					
				case "@output"	: _lump[$ "output" ]	= string_trim( __parser.remaining() ); break;
				case "@returns" : _lump[$ "return" ]	= string_trim( __parser.remaining() ); break;
				case "@throws"	: _lump[$ "throws" ]	= string_trim( __parser.remaining() ); break;
				case "@wiki"	:
					_file.wiki[$ "index" ] = __parser.next();
					
					if ( __parser.has_next() ) {
						_file.wiki[$ "category" ] = string_trim( __parser.remaining() );
						
					}
					break;
					
				default :
					__parser.reset();
					break;
					safe_throw( JSDocNotFoundException, [ _target.name, __parser.next(), _target.next ] );
					
					break;
					
			}
			
		} else {
			__parser.parse( _read );
			
			switch ( _layer ) {
				case 0 :
					switch ( __parser.next() ) {
						case "function" :
							var _string	= __strc( __parser.remaining(), 1, string_pos( ")", __parser.remaining() ) );
						// parse function header
							_file.header[$ "name" ]	= string_copy( _string, 1, string_pos( "(", _string ) - 1 );
							_file.header[$ "arguments" ] = string_explode( string_copy( _string, string_pos( "(", _string ) + 1, string_length( _string ) - string_pos( "(", _string ) - 1 ), ",", true );
						// create placeholder arguments
							var _i = 0; repeat( array_length( _file.header.arguments ) ) { _file.header.arguments[ _i ] = new Argument( _file.header.arguments[ _i ] ); ++_i; }
						// fill in file from lump
							var _i = 0; repeat( array_length( _lump.arguments ) ) {
								_file.header.arguments[ _i ]	= _lump.arguments[ _i ];
								++_i;
							}
							var _h = [ "description", "example", "output", "returns" ];
							
							var _i = 0; repeat( array_length( _h ) ) {
								if ( _lump[$ _h[ _i ] ] != undefined ) {
									_file[$ _h[ _i ] ]	= _lump[$ _h[ _i ] ];
									
								}
								++_i;
								
							}
						// if this is a function
							if ( string_pos( "constructor", __parser.remaining() ) == false ) {
								_file.type	= "function";
								
								file_read_to( _target, "{", "}" );
								
							} else {
								_file.type	= "constructor";
								
								if ( string_pos( ":", __parser.remaining() ) ) {
									_string	= __strd( __parser.remaining(), 1, string_pos( ":", __parser.remaining() ) );
									
									_file[$ "implements" ]	= __strc( _string, 1, string_pos( "(", _string ) - 1 );
									
								}
								++_layer;
								
							}
						// push creation to the stack
							_stack.push( _file );
						// reset file
							_file	= __file();
						// reset lump
							_lump	= __lump();
							
							continue;
							
						case "#macro" :
							
							continue;
							
						default :
							continue;
							
					}
					
				case 1 : // inside of constructors and objects
					_layer	+= string_count( "{", _read ) - string_count( "}", _read );
				// not a variable or a method, continue
					if ( string_pos( "=", _read ) == 0 ) { continue; }
					
					var _string	= string_explode( _read, "=", true );
					
				// method
					if ( string_pos( "function", _string[ 1 ] ) == 1 ) {
						var _string	= __strc( __parser.remaining(), 1, string_pos( ")", __parser.remaining() ) );
					// strip static if applicable
						if ( string_copy( _string, 1, 6 ) == "static" ) { _string = __strd( _string, 1, 6 ); }
					// create new method
						var _method	= new Method( __strc( _string, 1, string_pos( "=", _string ) - 1 ), __strc( _string, string_pos( "(", _string ) + 1, string_length( _string ) - string_pos( "(", _string ) - 1 ) );
					// fill in file from lump
						var _i = 0; repeat( array_length( _lump.arguments ) ) {
							_method.arguments[ _i ]	= _lump.arguments[ _i ];
							++_i;
						}
						var _h = [ "description", "returns" ];
						
						var _i = 0; repeat( array_length( _h ) ) {
							if ( _lump[$ _h[ _i ] ] != undefined ) {
								_method[$ _h[ _i ] ]	= _lump[$ _h[ _i ] ];
								
							}
							++_i;
							
						}
						_method.toLink();
						
						array_push( _stack.top().methods, _method );
						
						_lump	= __lump();
						
				// variable
					} else {
						__parser.parse( _string[ 0 ] );
						
						if ( __illegal.contains( __parser.peek() ) > -1 ) { continue; }
						if ( string_pos( ".", __parser.peek() ) > 0 ) { continue; }
						
						array_push( _stack.top().variables, new Variable( __parser.next(), _lump[$ "description" ] != undefined ? _lump.description : "No description." ) );
						
						_lump	= __lump();
						
					}
					continue;
					
				default : // everything else is GARBAGE
					_layer	+= string_count( "{", _read ) - string_count( "}", _read );
					
					break;
					
			}
			
		}
		
	}
	return _stack;
	
}
