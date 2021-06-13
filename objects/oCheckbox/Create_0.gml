// Inherit the parent event
event_inherited();

interface.onUp	= function() {
	var _state	= variable_instance_get( PROGRAM, value );
	
	variable_instance_set( PROGRAM, value, !_state );
	
	PROGRAM.save();
	
}
interface.onEnter	= function() {
	statusbar.set_text( "Export " + value );
	
}
