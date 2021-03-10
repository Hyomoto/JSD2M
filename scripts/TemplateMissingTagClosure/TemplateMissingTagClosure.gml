/// @exception	TemplateMissingTagClosure
/// @desc Called by file_read_to() when a matching closure was not found
function TemplateMissingTagClosure( _closure, _line ) {
	return "File missing " + string( _closure ) + " at line " + string( _line ) + "!";
	
}
