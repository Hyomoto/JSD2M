// Inherit the parent event
event_inherited();

Interface().add( interface );

interface.onUp	= function() {
	var _list	= console.display;
	var _string	= "";
	
	var _i = 0; repeat( _list.size() ) {
		if ( _string != "" ) { _string += "\n"; }
		_string += _list.find_index( _i++ ).text;
		
	}
	clipboard_set_text( _string )
	
	statusbar.set_text( "Saved to clipboard." );
	
}
interface.onEnter	= function() {
	statusbar.set_text( "Copy log to clipboard..." );
	
}
