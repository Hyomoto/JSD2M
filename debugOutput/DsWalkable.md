|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## DsWalkable( values... )
 walker = new DsWalkable( 1, 2, 3, 4, 5 );  while( walker.has_next() ) {   show_debug_message( walker.next() ); }
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---|
|values...|`undef`|none provided|

## Methods
|Jump To|[`top`](#)|[**start**](#start-at-)|[**has_next**](#has_next)|[**remaining**](#remaining)|[**next**](#next)|[**peek**](#peek)|[**is**](#is-_data_type-)|
|---|---|---|---|---|---|---|---|
> ### start( at )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|at|`int`|optional: The index to start at. Default: 0|

Starts the list at the given entry.
***
> ### has_next()
*Returns:* boolean (`true` or `false`)
|Name|Type|Purpose|
|---|---|---||None|||

Returns `true` if the list has not yet reached the end
***
> ### remaining()
*Returns:* int (`0..`)
|Name|Type|Purpose|
|---|---|---||None|||

Returns the number of links remaining in the list
***
> ### next()
*Returns:* Mixed
|Name|Type|Purpose|
|---|---|---||None|||

Returns the next value in the list
***
> ### peek()
*Returns:* Mixed
|Name|Type|Purpose|
|---|---|---||None|||

Returns the value at the current read position without advancing it
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
* step - none provided
* steps - none provided
