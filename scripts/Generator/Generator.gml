// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Generator() constructor {
	static read_file	= function( _source, _start_at ) {
		var _stack	= new DsStack();
		
		static __illegal	= new Array(["if", "else", "repeat", "while", "do", "until", "for", "switch", "break", "continue", "exit", "with", "return", "var" ]);
		static __parser		= new FileParser(" \t(").parse( _source );
		
		if ( not _source.exists() ) {
			throw FileNotFoundException;
			
		}
		//static strc	= function( _string, _x, _y ) { return string_trim( string_copy( _string, _x, _y ) ); }
		//static strd	= function( _string, _x, _y ) { return string_trim( string_delete( _string, _x, _y ) ); }
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
			wiki:{
				category: "Default",
				index: undefined
			},
			methods: [],
			variables: [],
			returns: "N/A `undefined`",
		}};
		
		var _last	= __parser.source.next;
		var _lump	= __lump();
		var _file	= __file();
		var _layer	= _start_at;
		
		if ( _layer == 1 ) { _stack.push( _file ); }
		
		var _read; while ( not __parser.eof() ) {
			if ( __parser.copy( 3 ) == "///" ) {
				__parser.advance( 4 );
				
				var _tag	= __parser.next();
				var _result	= read_tag( _tag, __parser );
				var _seek	= _file;
				
				if ( _result == undefined ) {
					safe_throw( JSDocNotFoundException, [ __parser.source.toString(), _tag, __parser.line() ] );
					
				} else if ( is_array( _lump[$ _result[ 0 ] ] ) ) {
					array_push( _lump[$ _result[ 0 ] ], _result[ 1 ] );
					
				} else {
					_lump[$ _result[ 0 ] ] = _result[ 1 ];
					
				}
				
			} else {
				switch ( _layer ) {
					case 0 :
						switch ( __parser.next() ) {
							case "function" :
								var _string	= strc( __parser.remaining(), 1, string_pos( ")", __parser.remaining() ) );
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
										_string	= strd( __parser.remaining(), 1, string_pos( ":", __parser.remaining() ) );
										
										_file[$ "implements" ]	= strc( _string, 1, string_pos( "(", _string ) - 1 );
										
									}
									++_layer;
									
								}
							// push creation to the stack
								_stack.push( _file );
							// reset file
								_file	= __file();
							// reset lump
								_lump	= __lump();
								
								break;
								
							case "#macro" :
								
								break;
								
							default :
								break;
								
						}
						break;
						
					case 1 : // inside of constructors and objects
						_layer	+= __parser.count( "{" ) - __parser.count( "}" );
						
					// not a variable or a method, continue
						if ( string_pos( "=", __parser.toString() ) == 0 ) { break; }
						
						var _string	= string_explode( __parser.toString(), "=", true );
						
					// method
						if ( string_pos( "function", _string[ 1 ] ) == 1 ) {
							var _string	= strc( __parser.remaining(), 1, string_pos( ")", __parser.remaining() ) );
						// strip static if applicable
							if ( string_copy( _string, 1, 6 ) == "static" ) { _string = strd( _string, 1, 6 ); }
						// create new method
							var _method	= new Method( strc( _string, 1, string_pos( "=", _string ) - 1 ), strc( _string, string_pos( "(", _string ) + 1, string_length( _string ) - string_pos( "(", _string ) - 1 ) );
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
							
							if ( __illegal.contains( __parser.peek() ) > -1 ) { break; }
							if ( string_pos( ".", __parser.peek() ) > 0 ) { break; }
							
							array_push( _stack.top().variables, new Variable( __parser.next(), _lump[$ "description" ] != undefined ? _lump.description : "No description." ) );
							
							_lump	= __lump();
							
						}
						break;
						
					default : // everything else is GARBAGE
						_layer	+= __parser.count( "{" ) - __parser.count( "}" );
						
						break;
						
				}
				
			}
			if ( _last != __parser.source.next ) {
				_last	= __parser.source.next;
				
			} else {
				__parser.next_line();
				
			}
			
		}
		return _stack;
		
	}
	static read_tag		= function( _tag, _parser ) {
		if ( ds_map_exists( library, _tag ) ) {
			return library[? _tag ]( _parser );
			
		}
		return undefined;
		
	}
	static add_jsdoc	= function( _tag, _method ) {
		if ( string_char_at( _tag, 1 ) != "@" ) {
			_tag	= "@" + _tag;
			
		}
		library[? _tag ]	= _method;
		
	}
	library	= ds_map_create();
	last	= 0;
	
}