|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## FAST_Event( FAST.event, delay, parameters, function )
 event = new FAST_Event( FAST.STEP, 30, undefined, function() {     show_debug_message( "Hello World!" ); });
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---|
|FAST.event|`list`|The event to add this to|
|delay|`int`|How many frames before firing|
|parameters|`mixed`|A value to pass to the function|
|function|`func`|The function to call when the delay has passed|

## Methods
|Jump To|[`top`](#)|[**once**](#once)|[**discard**](#discard)|[**toString**](#toString)|[**is**](#is-_data_type-)|
|---|---|---|---|---|---|
> ### once()
*Returns:* `self`
|Name|Type|Purpose|
|---|---|---||None|||

Tells the event it should only be run once. Can be called when the event is created, as it will still return the event.
***
> ### discard()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Destroys the event.
***
> ### toString()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Returns the event as a string, for debugging.
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
* tick - none provided
* tock - none provided
* repeats - none provided
* func - none provided
* params - none provided
* list - none provided
* ignore - none provided
