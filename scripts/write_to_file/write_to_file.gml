/// @func write_to_file
/// @param template	
/// @param target	
/// @param lump	
function write_to_file( _template, _target, _lump ){
	static __parser	= new Parser();
	static __strc	= function( _string, _x, _y ) { return string_trim( string_copy( _string, _x, _y ) ); }
	static __strd	= function( _string, _x, _y ) { return string_trim( string_delete( _string, _x, _y ) ); }
	
	if ( is_string( _template ) ) {
		_template	= new FileText( _templateStack.top(), false, true );
		
	}
	var _templateStack	= new DsStack();
	
	_templateStack.push( _template );
	
// will hold our for loops
	var _repeat	= new DsStack();

// will hold our local value stack
	var _source	= new DsStack( _lump );
// reset the template
	_templateStack.top().reset();
	
// create the file to write to
	_target	= new FileText( _target, false, true );
	
	var _read; while( not _templateStack.empty() ) {
		if ( _templateStack.top().eof() ) {
			if ( _templateStack.size() == 1 ) { break; }
			
			_templateStack.pop();
			
			var _l	= _templateStack.pop();
			
			_templateStack.top().next	= _l;
			
			continue;
			
		}		
		_read	= _templateStack.top().read();
		
		if ( string_copy( _read, 1, 2 ) == "//" ) { continue; } // comments
		if ( string_copy( _read, 1, 2 ) == "\\" ) { _read = string_delete( _read, 1, 1 ); }
		else if ( string_char_at( _read, 1 ) == "$" ) { // commands
			_read	= string_replace_all(_read, "--", "" );
			
			__parser.parse( _read );
			
			switch ( __parser.next() ) {
				case "$if" :
				// default comparison is if a statement is true
					var _comparison	= true;
				// check if not was sepcified, if so invert the comparison
					if ( __parser.peek() == "not" ) { _comparison = false; __parser.next(); }
				// pass the remaining string for evaluation
					var _k	= string_evaluate( __parser.remaining(), _source.top() );
				// if the result matches the comparison, continue with this branch
					if ( is_true( _k ) ) { continue; }
				// otherwise, skip this block
					try {
						var _last	= _templateStack.top().next;
						
						file_read_to( _templateStack.top(), "$if", "$endif", "$else" );
						
					} catch ( _ ) {
						var _meta;
						
						if ( _ == TemplateMissingTagClosure ) { _meta	= [ "$endif", _last ]; }
						
						safe_throw( _, _meta );
						
					}
					break;
					
				case "$foreach" :
				// find the value to assign to
					var _j	= __parser.next();
				// skip to, we don't verify because I'm lazy
					__parser.next();
				// find the value to assign from
					var _k = string_find_variable( __parser.next(), _source.top() );
					
					if ( not is_array( _k ) || array_length( _k ) == 0 ) {
						try {
							var _last	= _templateStack.top().next;
							
							file_read_to( _templateStack.top(), "$foreach", "$endfor" );
							
						} catch ( _ ) {
							var _meta;
							
							if ( _ == TemplateMissingTagClosure ) { _meta	= [ "$endfor", _last ]; }
							
							safe_throw( _, _meta );
							
						}
						continue;
						
					}
				// this will be our local variable packer, push k to j
					var _l = {}; variable_struct_set( _l, _j, _k[ 0 ] );
				// push l to source
					_source.push( _l );
				// push this loop to repeat
					_repeat.push({
						start: _templateStack.top().next,
						source: _k,
						value: _j,
						loop: 0,
					});
					continue;
					
				case "$appendto" :
					var _j	= __strc( __parser.remaining(), 1, string_pos( ",", __parser.remaining() ) - 1 );
					var _k	= string_delete( __parser.remaining(), 1, string_pos( ",", __parser.remaining() ) );
				// find target line
					_j	= _target.next + string_to_real( _j ) - 1;
					
					_target.poke( _j, _target.peek( _j ) + string_replace_tags( _k, _source.top() ) );
					
					continue;
					
				case "$endfor" :
				// found an endfor without an active foreach
					if ( _repeat.empty() ) { throw TemplateMissingForeach; }
				// if the loop has ended
					if ( ++_repeat.top().loop == array_length( _repeat.top().source ) ) {
						_repeat.pop();
						_source.pop();
						
						continue;
						
					}
				// reset the read position in template to the start of the loop
					_templateStack.top().next	= _repeat.top().start;
				// update our local value to the new source value
					variable_struct_set( _source.top(), _repeat.top().value, _repeat.top().source[ _repeat.top().loop ] );
					
					continue;
					
				case "$else" :
				// if else is naturally reached, we just finished an if branch, so seek next $endif
					try {
						var _last	= _templateStack.top().next;
						
						file_read_to( _templateStack.top(), "$if", "$endif" );
						
					} catch ( _ ) {
						var _meta;
						
						if ( _ == TemplateMissingTagClosure ) { _meta	= [ "$endif", _last ]; }
						
						safe_throw( _, _meta );
						
					}
					continue;
					
				case "$endif" :
				// if $endif is reached, do nothing.  we've naturally fallen out of scope
					continue;
					
				case "$template" :
				// push a new template to the stack and read from it
					var _t	= PROGRAM.templates[? __parser.peek() ];
					
					if ( _t == undefined ) {
						ERROR.notify( "Error in " + _templateStack.top().toString() + " at line " + string( _templateStack.top().next ) + ": template not found." );
						
						continue;
						
					}
					_templateStack.push( _templateStack.top().next );
					_templateStack.push( PROGRAM.templates[? __parser.peek() ] );
					_templateStack.top().reset();
					
					continue;
					
			}
			
		} else {
		// not an operation, thus we write the read to our target file and convert tags
			_target.write( string_replace_tags( _read, _source.top() ) );
			
		}
		
	}
	return _target;
	
}
