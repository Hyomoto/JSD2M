if ( stack == undefined ) { instance_destroy(); exit; }

timeFrame.reset();

while( timeFrame.elapsed() < 500000 ) {
	if ( stack.empty() ) { instance_destroy(); break; }
	
	var _source	= new FileText( stack.top().file, true );
	
	LOGGER.notify( ["build", "Processing " + _source.name + "..."] );
	
	try {
		var _input	= GENERATOR.read_file( _source, string_pos( "\\objects\\", stack.top().file ) > 0 );
		
	} catch (_) {
		var _meta = "";
		
		if ( _ == FileNotFoundException ) { _meta = _source.name;
			safe_throw( _, _meta );
			
			stack.pop();
			
			continue;
			
		}
		throw _;
		
	}
	if ( _input == undefined ) { continue; }
	
	var _name, _template	= "";
	
	repeat( _input.size() ) {
		switch ( _input.top().type ) {
			case "object" : _template = "object"; _name = _input.top().name; break;			
			case "function" : _template = "function"; _name = _input.top().header.name; break;
			case "constructor" : _template = "constructor" _name = _input.top().header.name; break;
		}
		if ( PROGRAM.templates[? _template ] == undefined ) {
			ERROR.notify( "ERROR! No template found for " + _name + " of type " + _input.top().type + "! Skipped." );
			continue;
		}
		LOGGER.notify( ["build,"+_template, "Writing " + _template + " as " + _name + ".md."] );
		write_to_file( PROGRAM.templates[? _template ], new FileText( PROGRAM.savePath + _name + ".md", false, true ), _input.pop(), _name ).close();
		
		++actual;
		
	}
	processed	+= 1;
	_source.discard();
	stack.pop();
	
}
loadingbar.update( string_con( processed, "/", total ), processed / total );
