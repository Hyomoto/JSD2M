set_clipboard	= function( _true ) {
	icon	= ( _true ? 3 : 4 );
	
	Generator.clipboard		= _true;
	oButtonSaveTo.enable	= !_true;
	textbox_save.enable		= !_true;
	
}

// Inherit the parent event
event_inherited();

interface.onEnter	= function() {
	if ( icon == 3 ) { statusbar.set_text( "Target: Clipboard" ) }
	else { statusbar.set_text( "Target: Directory" ) }
	
}
interface.onUp	= function() {
	set_clipboard( !Generator.clipboard );
	
}
