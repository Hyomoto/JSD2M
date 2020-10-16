|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## ArrayList( size, *default )
 array = new ArrayList( 10, 0 );  array.insert( 5, 10 ); array.remove( 0 );
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---|
|size|`undef`|none provided|
|*default|`undef`|none provided|

## Methods
|Jump To|[`top`](#)|[**insert**](#insert-index-value-)|[**remove**](#remove-index-)|[**add**](#add-value-)|
|---|---|---|---|---|
> ### insert( index, value )
*Returns:* `value`
|Name|Type|Purpose|
|---|---|---|
|index|`int`|The index to insert the value at, must be <= the size of the array|
|value|`mixed`|The value to insert into the array|

no description provided
***
> ### remove( index )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|index|`int`|The index to remove|

Removes an index from the array, shrinking it.
***
> ### add( value )
*Returns:* `value`
|Name|Type|Purpose|
|---|---|---|
|value|`mixed`|The value to add to the array|

Adds a value to the end of the array, growing it if necessarry.
***

## Variables
|Jump To|[`top`](#)|
|---|---|
* aggression - none provided
