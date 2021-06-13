loadingbar.visible	= false;

LOGGER.notify( ["build", string_con( "Complete! ", actual, " files written. Took ", timeTotal.toString(), "." )] );

wiki.write( PROGRAM.savePath );
