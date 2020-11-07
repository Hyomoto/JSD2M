// Inherit the parent event
event_inherited();

Interface().add( interface );

enable	= false;

interface.onUp	= function() {
	enable	= !enable;
	
	if ( enable ) { console.add_filter( filter ); }
	else { console.remove_filter( filter ); }
	
}
interface.onEnter	= function() {
	statusbar.set_text( "Filter: " + filter );
	
}
