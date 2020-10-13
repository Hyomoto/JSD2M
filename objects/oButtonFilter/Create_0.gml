// Inherit the parent event
event_inherited();

enable	= false;

interface.onUp	= function() {
	enable	= !enable;
	
	if ( enable ) { console.add_filter( filter ); }
	else { console.remove_filter( filter ); }
	
}
