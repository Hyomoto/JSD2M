/// @desc Write Files
while ( output.empty() == false ) {
	var _out	= output.dequeue();
	var _result	= undefined;
	
	if ( _out.wikiIndex != undefined ) {
		table.add( _out.wikiIndex, _out.wikiCategory, { name : _out.header, path : wikiPath + _out.name } );
		
	}
	switch ( instanceof( _out ) ) {
		case "Method" :
// define layout
var _header	= @"|Jump To|[`Go Back`]({$wikiIndex})|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## {$header}
*Returns:* {$returns}

{$desc}
```GML
{$example}
```";

var _arguments	= @"## Arguments
|Name|Type|Purpose|
|---|---|---|";
var _arg	= "|{$name}|`{$type}`|{$desc}|";
			
			_header	= string_replace_tags( _header, _out );
			// write arguments
			if ( array_length( _out.args ) == 0 ) {
				_arguments += "\n|None|||";
				
			} else {
				var _i = 0; repeat( array_length( _out.args ) ) {
					_arguments += "\n" + string_replace_tags( _arg, _out.args[ _i ] );
					++_i;
				}
				
			}
			_arguments += "\n";
			
			var _result		= _header + "\n" + _arguments;
			
			break;
			
		case "Constructor" :
// define layout
var _header	= @"|Jump To|[`Go Back`]({$wikiIndex})|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## {$header}
*Implements:* {$implements}

{$desc}
```GML
{$example}
```";

var _arguments	= @"## Arguments
|Name|Type|Purpose|
|---|---|---|";
var _arg	= "|{$name}|`{$type}`|{$desc}|"

var _methodh	= @"## Methods
|Jump To|[`top`](#)|";
var _methodm	= "[**{$name}**](#{$pattern})|";

var _methods	= "";
var _method		= @"> ### {$header}
*Returns:* {$returns}
|Name|Type|Purpose|
|---|---|---|";
var _methodf	= @"
{$desc}
***
";

var _variables	= @"## Variables
|Jump To|[`top`](#)|
|---|---|";
var _var	= "* {$name} - {$desc}";
			
			_header	= string_replace_tags( _header, _out );
			// write arguments
			if ( array_length( _out.args ) == 0 ) {
				_arguments += "\n|None|||";
				
			} else {
				var _i = 0; repeat( array_length( _out.args ) ) {
					_arguments += "\n" + string_replace_tags( _arg, _out.args[ _i ] );
					++_i;
				}
				
			}
			_arguments += "\n";
			// write method toolbar
			var _foot	= true;
			var _i = 2, _j = undefined; repeat( _out.methods.size() ) {
				_j	= _out.methods.next( _j );
				
				_methodh	+= string_replace_tags( _methodm, _j.value );
				++_i;
				
				if ( _i > 10 ) {
					_methodh += "\n|" + string_repeat( "---|", _i ) + "\n";
					_foot	= false;
					_i		= 0;
					
				}
				
			}
			if ( _foot ) { _methodh += "\n|" + string_repeat( "---|", _i ); }
			
			// write methods
			if ( _out.methods.size() == 0 ) {
				_methods	+= "\n\nNo methods defined.";
				
			} else {
				var _i = undefined; repeat( _out.methods.size() ) {
					_i	= _out.methods.next( _i );
					_methods	+= string_replace_tags( _method, _i.value );
					
					// write arguments
					if ( array_length( _i.value.args ) == 0 ) {
						_methods += "\n|None|||";
						
					} else {
						var _j = 0; repeat( array_length( _i.value.args ) ) {
							_methods += "\n" + string_replace_tags( _arg, _i.value.args[ _j ] );
							++_j;
						}
						
					}
					_methods	+= "\n" + string_replace_tags( _methodf, _i.value );
					
				}
				
			}
			// write variables
			if ( _out.variables.size() == 0 ) {
				_variables	+= "\n\nNo variables defined.";
				
			} else {
				var _i = undefined; repeat( _out.variables.size() ) {
					_i	= _out.variables.next( _i );
					
					_variables	+= "\n" + string_replace_tags( _var, _i.value );
					
				}
				
			}
			_result		= _header + "\n" + _arguments + "\n" + _methodh + "\n" + _methods + "\n" + _variables;
			
			break;

		case "Object" :
// define layout
var _header	= @"|Jump To|[`Go Back`]({$wikiIndex})|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## {$header}

{$desc}";
var _arg	= "|{$name}|`{$type}`|{$desc}|";
var _methodh	= @"## Methods
|Jump To|[`top`](#)|";
var _methodm	= "[**{$name}**](#{$pattern})|";

var _methods	= "";
var _method		= @"> ### {$header}
*Returns:* {$returns}
|Name|Type|Purpose|
|---|---|---|";
var _methodf	= @"
{$desc}
***
";

var _variables	= @"## Variables
|Jump To|[`top`](#)|
|---|---|";
var _var	= "* {$name} - {$desc}";
			
			_header	= string_replace_tags( _header, _out );
			// write method toolbar
			var _foot	= true;
			var _i = 2, _j = undefined; repeat( _out.methods.size() ) {
				_j	= _out.methods.next( _j );
				
				_methodh	+= string_replace_tags( _methodm, _j.value );
				++_i;
				
				if ( _i > 10 ) {
					_methodh += "\n|" + string_repeat( "---|", _i ) + "\n";
					_foot	= false;
					_i		= 0;
					
				}
				
			}
			if ( _foot ) { _methodh += "\n|" + string_repeat( "---|", _i ); }
			
			// write methods
			if ( _out.methods.size() == 0 ) {
				_methods	+= "\n\nNo methods defined.";
				
			} else {
				var _i = undefined; repeat( _out.methods.size() ) {
					_i	= _out.methods.next( _i );
					_methods	+= string_replace_tags( _method, _i.value );
					
					// write arguments
					if ( array_length( _i.value.args ) == 0 ) {
						_methods += "\n|None|||";
						
					} else {
						var _j = 0; repeat( array_length( _i.value.args ) ) {
							_methods += "\n" + string_replace_tags( _arg, _i.value.args[ _j ] );
							++_j;
						}
						
					}
					_methods	+= "\n" + string_replace_tags( _methodf, _i.value );
					
				}
				
			}
			// write variables
			if ( _out.variables.size() == 0 ) {
				_variables	+= "\n\nNo variables defined.";
				
			} else {
				var _i = undefined; repeat( _out.variables.size() ) {
					_i	= _out.variables.next( _i );
					
					_variables	+= "\n" + string_replace_tags( _var, _i.value );
					
				}
				
			}
			_result		= _header + "\n" + _methodh + "\n" + _methods + "\n" + _variables;
			
			break;
			
	}
	var _filename	= _out.name + ".md";
	
	if ( clipboard ) {
		clipboard_set_text( _result );
		
		trace( "build", "Pasted to clipboard." );
		
		output.clear();
		
		break;
		
	} else if ( overwrite || file_exists( path + _filename ) == false ) {
		var _file = new FileText( savePath + _filename, false, true );
		
		trace( "build", "Writing to ", path + _filename, "..." );
		
		_file.write( _result );
		
		_file.close();
		
		++final;
		
	}
	_result	= undefined;
	
}
