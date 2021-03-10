/// @func file_read_to
function file_read_to( _file, _from, _to, _break ) {
	static __parser	= new Parser();
	
	var _read, _depth	 = 0;
	
	while ( not _file.eof() ) {
		__parser.parse( _file.read() );
		
		_read	= __parser.next();
		
		if ( _read == _from ) { ++_depth continue; }
		else if ( _read == _to && _depth > 0 ) { --_depth; continue }
		else if ( _read == _break && _depth == 0 ) { return true; }
		else if ( _read != _to || _depth > 0 ) { continue; }
		
		--_depth;
		
		break;
		
	}
	if ( _depth > -1 ) { throw FileTagClosureMissing; }
	
	return false;
	
}
