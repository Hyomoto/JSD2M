/// @func FileParser
/// @desc Will break up strings based on white space, and allow them to be read from much like you
// would a text file. You can check if there is more to read, or request the new word in the string. Also
// serves as an interface for building use-case specific parsers such as the (#ScriptParser).
/// @example
//var _parser = new Parser().parse( "Hello World!" )
//
//while( _parser.has_next() ) {
//	show_debug_message( _parser.next() );
//}
/// @wiki Core-Index Parsing
function FileParser( _divider ) : Parser( _divider ) constructor {
	static parseSuper	= parse;
	static parse	= function( _file ) {
		if ( is_struct_of( _file, File ) == false ) {
			return;
			
		}
		source	= _file;
		
		next_line();
		
		return self;
		
	}
	static next_line	= function() {
		if ( source == undefined || source.eof() ) { return; }
		
		content	= string_trim( source.read() );
		reset();
		
	}
	static line			= function() {
		if ( source == undefined ) { return 0; }
		
		return source.next;
		
	}
	static eof			= function() {
		if ( source == undefined ) { return true; }
		
		return source.eof();
		
	}
	source	= undefined;
	
}
