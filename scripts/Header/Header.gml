function Header( _file, _parser ) constructor {
	name	= "";
	desc		= undefined;
	example		= undefined;
	returns		= undefined;	
	macro		= undefined;
	arguments	= new DsLinkedList();
	wikiIndex	= undefined;
	wikiCategory= "Default";
	duplicate	= false;
	alias		= false;
	
	while ( _file.eof() == false ) {
		var _read	= _file.read();
		var _tag	= string_find_tag( _read );
		
		if ( _tag == undefined ) { --_file.next; break; }
		
		switch ( _tag[ 0 ] ) {
			case "@alias" :
				name	= _tag[ 1 ];
				alias	= true;
				
				return;
			
			case "@func" : case "@function" :
				name	= _tag[ 1 ];
				
				continue;
				
			case "@duplicate" : case "@dupe" :
				duplicate	= true;
				
				continue;
				
			case "@ret" : case "@return" : case "@returns" :
				returns	= lookup_return( _tag[ 1 ] );
				
				continue;
				
			case "@wiki" :
				_read	= string_split_next( _tag[ 1 ], " \t" );
				
				wikiIndex	= _read[ 0 ];
				
				if ( array_length( _read ) > 1 ) { wikiCategory = _read[ 1 ]; }
				
				continue;
			
			case "@macro" :
				_read	= string_split_next( _tag[ 1 ], " \t" );
				
				macro	= { type : strc( _tag[ 1 ], 1, _read - 1 ), name : strd( _tag[ 1 ], 1, _read ) }
				
				continue;
				
			case "@param" :
				arguments.add( new Argument( _tag[ 1 ] ) );
				
				continue;
				
			case "@desc" :
				desc	= _tag[ 1 ];
				
				while ( _file.eof() == false ) {
					_read	= string_trim( _file.peek( _file.next ) );
					
					if ( string_find_tag( _read ) != undefined || string_copy( _read, 1, 2 ) != "//" ) { break; }
					
					desc	+= " " + strd( _read, 1, 2 );
					
					_file.read();
					
				}
				continue;
				
			case "@example" :
				example	= _tag[ 1 ];
				
				while ( _file.eof() == false ) {
					_read	= string_trim( _file.peek( _file.next ) );
					
					if ( string_find_tag( _read ) != undefined || string_copy( _read, 1, 2 ) != "//" ) { break; }
					
					example	+= "\n" + string_delete( _read, 1, 2 );
					
					_file.read();
					
				}
				continue;
				
			default : break;
			
		}
		break;
		
	}
	
}
