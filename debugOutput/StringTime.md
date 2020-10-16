|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## StringTime( seconds, decimals, format )
 var _time = new StringTime( get_timer(), 0, "$H hours, $M minutes, and $seconds" );  show_debug_message( _time );
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---|
|seconds|`int`|The number of seconds|
|decimals|`int`|How many decimals each time should contain|
|format|`string`|The display format, $H, $M and $S will be replaced with hours, minutes, and seconds|

## Methods
|Jump To|[`top`](#)|[**set**](#set-seconds-)|
|---|---|---|
> ### set( seconds )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|seconds|`int`|The number of seconds to set the time to|

Will format the provided seconds into a formatted time string.
***

## Variables
|Jump To|[`top`](#)|
|---|---|
* format - none provided
* decimals - none provided
