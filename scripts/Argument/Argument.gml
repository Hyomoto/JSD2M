function Argument( _string ) constructor {
	static __parser	= new Parser();
	
	__parser.parse( _string );
	
	var _name	= "null";
	var _desc	= "No description";
	var _type	= "undef";
	
	if ( __parser.has_next() ) {
		if ( string_char_at( __parser.peek(), 1 ) == "{" ) {
			_type	= new Type( __parser.next() );
			
		}
		if ( __parser.has_next() ) {
			_name	= __parser.next();
			
		}
		if ( __parser.has_next() ) {
			_desc	= string_trim( __parser.remaining() );
			
		}
		
	}
	name		= _name;
	description	= _desc;
	type		= _type;
	
}
/*
string_char_at argument 1 incorrect type (undefined) expecting a String (YYGS), longMessage : ERROR in
action number 1
of  Step Event0
for object oGenerator:

string_char_at argument 1 incorrect type (undefined) expecting a String (YYGS)
 at gml_Script_Argument (line 10) -        if ( string_char_at( __parser.peek(), 1 ) == "{" ) {

"gml_Script_Argument (line 10)","gml_Script_anon_3206746D_616 (line 27)",
"gml_Script_anon_Generator_gml_GlobalScript_Generator_10301_Generator_gml_GlobalScript_Generator (line 316) -                      return library[? _tag ]( _parser );",
"gml_Script_anon_Generator_gml_GlobalScript_Generator_185_Generator_gml_GlobalScript_Generator (line 72) -                             var _result       = read_tag( _tag, __parser );",
"gml_Object_oGenerator_Step_0 (line 10) -               var _input       = GENERATOR.read_file( _source, string_pos( "\\objects\\", stack.top().file ) > 0 ); " ],

*/