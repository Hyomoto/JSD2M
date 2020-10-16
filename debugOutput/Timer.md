|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## Timer( format, decimals )
 var _timer = new Timer( "$S seconds", 2 );  if ( _timer.elapsed() > 100000 ) {   show_debug_message( string( _timer ) ); }
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---|
|format|`string`|The display format, $H, $M and $S will be replaced with hours, minutes, and seconds|
|decimals|`int`|How many decimals each time unit should contain|

## Methods
|Jump To|[`top`](#)|[**reset**](#reset)|[**elapsed**](#elapsed)|[**toString**](#toString)|[**is**](#is-_data_type-)|
|---|---|---|---|---|---|
> ### reset()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Resets the elapsed time to the current moment.
***
> ### elapsed()
*Returns:* int (`0..`)
|Name|Type|Purpose|
|---|---|---||None|||

Returns the time elapsed between the start time and now, in microseconds.
***
> ### toString()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Returns the elapsed time as a formatted StringTime-formatted string.
***
> ### is( _data_type )
*Returns:* N/A `undefined`
|Name|Type|Purpose|
|---|---|---|
|_data_type|`undef`|none provided|

No description.
***

## Variables
|Jump To|[`top`](#)|
|---|---|
* content - none provided
* start - none provided
